// Copyright 2022 The Forgotten Server Authors. All rights reserved.
// Use of this source code is governed by the GPL-2.0 License that can be found in the LICENSE file.

#include "otpch.h"

#include "actions.h"
#include "bed.h"
#include "configmanager.h"
#include "container.h"
#include "game.h"
#include "pugicast.h"
#include "spells.h"
#include <fmt/format.h>

extern Game g_game;
extern Spells* g_spells;
extern Actions* g_actions;
extern ConfigManager g_config;

Actions::Actions() :
	scriptInterface("Action Interface")
{
	scriptInterface.initState();
}

Actions::~Actions()
{
	clear(false);
}

void Actions::clearMap(ActionUseMap& map, bool fromLua)
{
	for (auto it = map.begin(); it != map.end(); ) {
		if (fromLua == it->second.fromLua) {
			it = map.erase(it);
		} else {
			++it;
		}
	}
}

void Actions::clear(bool fromLua)
{
	clearMap(useItemMap, fromLua);
	clearMap(uniqueItemMap, fromLua);
	clearMap(actionItemMap, fromLua);

	reInitState(fromLua);
}

LuaScriptInterface& Actions::getScriptInterface()
{
	return scriptInterface;
}

std::string Actions::getScriptBaseName() const
{
	return "actions";
}

Event_ptr Actions::getEvent(const std::string& nodeName)
{
	if (strcasecmp(nodeName.c_str(), "action") != 0) {
		return nullptr;
	}
	return Event_ptr(new Action(&scriptInterface));
}

bool Actions::registerEvent(Event_ptr event, const pugi::xml_node& node)
{
	Action_ptr action{static_cast<Action*>(event.release())}; //event is guaranteed to be an Action

	pugi::xml_attribute attr;
	if ((attr = node.attribute("itemid"))) {
		std::vector<int32_t> idList = vectorAtoi(explodeString(attr.as_string(), ";"));
		bool success = true;

		for (const auto& id : idList) {
			auto result = useItemMap.emplace(id, std::move(*action));
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << id << std::endl;
				success = false;
			}
		}

		return success;
	} else if ((attr = node.attribute("fromid"))) {
		pugi::xml_attribute toIdAttribute = node.attribute("toid");
		if (!toIdAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing toid in fromid: " << attr.as_string() << std::endl;
			return false;
		}

		uint16_t fromId = pugi::cast<uint16_t>(attr.value());
		uint16_t iterId = fromId;
		uint16_t toId = pugi::cast<uint16_t>(toIdAttribute.value());

		auto result = useItemMap.emplace(iterId, *action);
		if (!result.second) {
			std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << iterId << " in fromid: " << fromId << ", toid: " << toId << std::endl;
		}

		bool success = result.second;
		while (++iterId <= toId) {
			result = useItemMap.emplace(iterId, *action);
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << iterId << " in fromid: " << fromId << ", toid: " << toId << std::endl;
				continue;
			}
			success = true;
		}
		return success;
	} else if ((attr = node.attribute("uniqueid"))) {
		std::vector<int32_t> uidList = vectorAtoi(explodeString(attr.as_string(), ";"));
		bool success = true;

		for (const auto& uid : uidList) {
			auto result = uniqueItemMap.emplace(uid, std::move(*action));
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with uniqueid: " << uid << std::endl;
				success = false;
			}
		}

		return success;
	} else if ((attr = node.attribute("fromuid"))) {
		pugi::xml_attribute toUidAttribute = node.attribute("touid");
		if (!toUidAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing touid in fromuid: " << attr.as_string() << std::endl;
			return false;
		}

		uint16_t fromUid = pugi::cast<uint16_t>(attr.value());
		uint16_t iterUid = fromUid;
		uint16_t toUid = pugi::cast<uint16_t>(toUidAttribute.value());

		auto result = uniqueItemMap.emplace(iterUid, *action);
		if (!result.second) {
			std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with unique id: " << iterUid << " in fromuid: " << fromUid << ", touid: " << toUid << std::endl;
		}

		bool success = result.second;
		while (++iterUid <= toUid) {
			result = uniqueItemMap.emplace(iterUid, *action);
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with unique id: " << iterUid << " in fromuid: " << fromUid << ", touid: " << toUid << std::endl;
				continue;
			}
			success = true;
		}
		return success;
	} else if ((attr = node.attribute("actionid"))) {
		std::vector<int32_t> aidList = vectorAtoi(explodeString(attr.as_string(), ";"));
		bool success = true;

		for (const auto& aid : aidList) {
			auto result = actionItemMap.emplace(aid, std::move(*action));
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with actionid: " << aid << std::endl;
				success = false;
			}
		}

		return success;
	} else if ((attr = node.attribute("fromaid"))) {
		pugi::xml_attribute toAidAttribute = node.attribute("toaid");
		if (!toAidAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing toaid in fromaid: " << attr.as_string() << std::endl;
			return false;
		}

		uint16_t fromAid = pugi::cast<uint16_t>(attr.value());
		uint16_t iterAid = fromAid;
		uint16_t toAid = pugi::cast<uint16_t>(toAidAttribute.value());

		auto result = actionItemMap.emplace(iterAid, *action);
		if (!result.second) {
			std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with action id: " << iterAid << " in fromaid: " << fromAid << ", toaid: " << toAid << std::endl;
		}

		bool success = result.second;
		while (++iterAid <= toAid) {
			result = actionItemMap.emplace(iterAid, *action);
			if (!result.second) {
				std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with action id: " << iterAid << " in fromaid: " << fromAid << ", toaid: " << toAid << std::endl;
				continue;
			}
			success = true;
		}
		return success;
	}
	return false;
}

bool Actions::registerLuaEvent(Action* event)
{
	Action_ptr action{ event };
	if (!action->getItemIdRange().empty()) {
		const auto& range = action->getItemIdRange();
		for (auto id : range) {
			auto result = useItemMap.emplace(id, *action);
			if (!result.second) {
				//std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with id: " << id << " in range from id: " << range.front() << ", to id: " << range.back() << std::endl;
			}
		}
		return true;
	} else if (!action->getUniqueIdRange().empty()) {
		const auto& range = action->getUniqueIdRange();
		for (auto id : range) {
			auto result = uniqueItemMap.emplace(id, *action);
			if (!result.second) {
				std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with uid: " << id << " in range from uid: " << range.front() << ", to uid: " << range.back() << std::endl;
			}
		}
		return true;
	} else if (!action->getActionIdRange().empty()) {
		const auto& range = action->getActionIdRange();
		for (auto id : range) {
			auto result = actionItemMap.emplace(id, *action);
			if (!result.second) {
				std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with aid: " << id << " in range from aid: " << range.front() << ", to aid: " << range.back() << std::endl;
			}
		}
		return true;
	}

	//std::cout << "[Warning - Actions::registerLuaEvent] There is no id / aid / uid set for this event" << std::endl;
	return false;
}

ReturnValue Actions::canUse(const Player* player, const Position& pos)
{
	if (pos.x != 0xFFFF) {
		const Position& playerPos = player->getPosition();
		if (playerPos.z != pos.z) {
			return playerPos.z > pos.z ? RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
		}

		if (!Position::areInRange<1, 1>(playerPos, pos)) {
			return RETURNVALUE_TOOFARAWAY;
		}
	}
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUse(const Player* player, const Position& pos, const Item* item)
{
	Action* action = getAction(item);
	if (action) {
		return action->canExecuteAction(player, pos);
	}
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUseFar(const Creature* creature, const Position& toPos, bool checkLineOfSight, bool checkFloor)
{
	if (toPos.x == 0xFFFF) {
		return RETURNVALUE_NOERROR;
	}

	const Position& creaturePos = creature->getPosition();
	if (checkFloor && creaturePos.z != toPos.z) {
		return creaturePos.z > toPos.z ? RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
	}

	if (!Position::areInRange<7, 5>(toPos, creaturePos)) {
		return RETURNVALUE_TOOFARAWAY;
	}

	if (checkLineOfSight && !g_game.canThrowObjectTo(creaturePos, toPos, checkLineOfSight, checkFloor)) {
		return RETURNVALUE_CANNOTTHROW;
	}

	return RETURNVALUE_NOERROR;
}

Action* Actions::getAction(const Item* item)
{
	if (item->hasAttribute(ITEM_ATTRIBUTE_UNIQUEID)) {
		auto it = uniqueItemMap.find(item->getUniqueId());
		if (it != uniqueItemMap.end()) {
			return &it->second;
		}
	}

	if (item->hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) {
		auto it = actionItemMap.find(item->getActionId());
		if (it != actionItemMap.end()) {
			return &it->second;
		}
	}

	auto it = useItemMap.find(item->getID());
	if (it != useItemMap.end()) {
		return &it->second;
	}

	//rune items
	return g_spells->getRuneSpell(item->getID());
}

ReturnValue Actions::internalUseItem(Player* player, const Position& pos, uint8_t index, Item* item, bool isHotkey)
{
	if (Door* door = item->getDoor()) {
		if (!door->canUse(player)) {
			return RETURNVALUE_NOTPOSSIBLE;
		}
	}

	Action* action = getAction(item);
	if (action) {
		if (action->isScripted()) {
			if (action->executeUse(player, item, pos, nullptr, pos, isHotkey)) {
				return RETURNVALUE_NOERROR;
			}

			if (item->isRemoved()) {
				return RETURNVALUE_CANNOTUSETHISOBJECT;
			}
		} else if (action->function && action->function(player, item, pos, nullptr, pos, isHotkey)) {
			return RETURNVALUE_NOERROR;
		}
	}

	if (BedItem* bed = item->getBed()) {
		if (!bed->canUse(player)) {
			if (!bed->getHouse()) {
				return RETURNVALUE_YOUCANNOTUSETHISBED;
			}

			if (!player->isPremium()) {
				return RETURNVALUE_YOUNEEDPREMIUMACCOUNT;
			}
			return RETURNVALUE_CANNOTUSETHISOBJECT;
		}

		if (bed->trySleep(player)) {
			player->setBedItem(bed);
			g_game.sendOfflineTrainingDialog(player);
		}

		return RETURNVALUE_NOERROR;
	}

	if (Container* container = item->getContainer()) {
		Container* openContainer;

		//depot container
		if (DepotLocker* depot = container->getDepotLocker()) {
			DepotLocker* myDepotLocker = player->getDepotLocker(depot->getDepotId());
			myDepotLocker->setParent(depot->getParent()->getTile());
			openContainer = myDepotLocker;
			player->setLastDepotId(depot->getDepotId());
		} else {
			openContainer = container;
		}

		uint32_t corpseOwner = container->getCorpseOwner();
		if (corpseOwner != 0 && !player->canOpenCorpse(corpseOwner)) {
			return RETURNVALUE_YOUARENOTTHEOWNER;
		}

		//open/close container
		int32_t oldContainerId = player->getContainerID(openContainer);
		if (oldContainerId == -1) {
			player->addContainer(index, openContainer);
			player->onSendContainer(openContainer);
		} else {
			player->onCloseContainer(openContainer);
			player->closeContainer(oldContainerId);
		}

		return RETURNVALUE_NOERROR;
	}

	const ItemType& it = Item::items[item->getID()];
	if (it.canReadText) {
		if (it.canWriteText) {
			player->setWriteItem(item, it.maxTextLen);
			player->sendTextWindow(item, it.maxTextLen, true);
		} else {
			player->setWriteItem(nullptr);
			player->sendTextWindow(item, 0, false);
		}

		return RETURNVALUE_NOERROR;
	}

	return RETURNVALUE_CANNOTUSETHISOBJECT;
}


static void showUseHotkeyMessage(Player* player, const Item* item, uint32_t count)
{
	const ItemType& it = Item::items[item->getID()];
	if (!it.showCount) {
		player->sendTextMessage(MESSAGE_INFO_DESCR, fmt::format("Using one of {:s}...",  item->getName()));
	} else if (count == 1) {
		player->sendTextMessage(MESSAGE_INFO_DESCR, fmt::format("Using the last {:s}...",  item->getName()));
	} else {
		player->sendTextMessage(MESSAGE_INFO_DESCR, fmt::format("Using one of {:d} {:s}...", count, item->getPluralName()));
	}
}

bool Actions::useItem(Player* player, const Position& pos, uint8_t index, Item* item, bool isHotkey)
{
	player->setNextAction(OTSYS_TIME() + g_config.getNumber(ConfigManager::ACTIONS_DELAY_INTERVAL));

	if (isHotkey) {
		uint16_t subType = item->getSubType();
		showUseHotkeyMessage(player, item, player->getItemTypeCount(item->getID(), subType != item->getItemCount() ? subType : -1));
	}

	if (g_config.getBoolean(ConfigManager::ONLY_INVITED_CAN_MOVE_HOUSE_ITEMS)) {
		if (const HouseTile* const houseTile = dynamic_cast<const HouseTile*>(item->getTile())) {
			if (!item->getTopParent()->getCreature() && !houseTile->getHouse()->isInvited(player)) {
				player->sendCancelMessage(RETURNVALUE_PLAYERISNOTINVITED);
				return false;
			}
		}
	}

	ReturnValue ret = internalUseItem(player, pos, index, item, isHotkey);
	if (ret == RETURNVALUE_YOUCANNOTUSETHISBED) {
		g_game.internalCreatureSay(player, TALKTYPE_MONSTER_SAY, getReturnMessage(ret), false);
		return false;
	}

	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		return false;
	}

	return true;
}

bool Actions::useItemEx(Player* player, const Position& fromPos, const Position& toPos,
                        uint8_t toStackPos, Item* item, bool isHotkey, Creature* creature/* = nullptr*/)
{
	player->setNextAction(OTSYS_TIME() + g_config.getNumber(ConfigManager::EX_ACTIONS_DELAY_INTERVAL));

	Action* action = getAction(item);
	if (!action) {
		player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
		return false;
	}

	ReturnValue ret = action->canExecuteAction(player, toPos);
	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		return false;
	}

	if (isHotkey) {
		uint16_t subType = item->getSubType();
		showUseHotkeyMessage(player, item, player->getItemTypeCount(item->getID(), subType != item->getItemCount() ? subType : -1));
	}

	if (g_config.getBoolean(ConfigManager::ONLY_INVITED_CAN_MOVE_HOUSE_ITEMS)) {
		if (const HouseTile* const houseTile = dynamic_cast<const HouseTile*>(item->getTile())) {
			if (!item->getTopParent()->getCreature() && !houseTile->getHouse()->isInvited(player)) {
				player->sendCancelMessage(RETURNVALUE_PLAYERISNOTINVITED);
				return false;
			}
		}
	}

	if (action->executeUse(player, item, fromPos, action->getTarget(player, creature, toPos, toStackPos), toPos, isHotkey)) {
		return true;
	}

	if (!action->hasOwnErrorHandler()) {
		player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
	}

	return false;
}

Action::Action(LuaScriptInterface* interface) :
	Event(interface), function(nullptr), allowFarUse(false), checkFloor(true), checkLineOfSight(true) {}

bool Action::configureEvent(const pugi::xml_node& node)
{
	pugi::xml_attribute allowFarUseAttr = node.attribute("allowfaruse");
	if (allowFarUseAttr) {
		allowFarUse = allowFarUseAttr.as_bool();
	}

	pugi::xml_attribute blockWallsAttr = node.attribute("blockwalls");
	if (blockWallsAttr) {
		checkLineOfSight = blockWallsAttr.as_bool();
	}

	pugi::xml_attribute checkFloorAttr = node.attribute("checkfloor");
	if (checkFloorAttr) {
		checkFloor = checkFloorAttr.as_bool();
	}

	return true;
}

namespace {

bool enterMarket(Player* player, Item*, const Position&, Thing*, const Position&, bool)
{
	if (player->getLastDepotId() == -1) {
		return false;
	}

	player->sendMarketEnter(player->getLastDepotId());
	return true;
}

}

bool Action::loadFunction(const pugi::xml_attribute& attr, bool isScripted)
{
	const char* functionName = attr.as_string();
	if (strcasecmp(functionName, "market") == 0) {
		function = enterMarket;
	} else {
		if (!isScripted) {
			std::cout << "[Warning - Action::loadFunction] Function \"" << functionName << "\" does not exist." << std::endl;
			return false;
		}
	}

	if (!isScripted) {
		scripted = false;
	}
	return true;
}

std::string Action::getScriptEventName() const
{
	return "onUse";
}

ReturnValue Action::canExecuteAction(const Player* player, const Position& toPos)
{
	if (allowFarUse) {
		return g_actions->canUseFar(player, toPos, checkLineOfSight, checkFloor);
	}
	return g_actions->canUse(player, toPos);
}

Thing* Action::getTarget(Player* player, Creature* targetCreature, const Position& toPosition, uint8_t toStackPos) const
{
	if (targetCreature) {
		return targetCreature;
	}
	return g_game.internalGetThing(player, toPosition, toStackPos, 0, STACKPOS_USETARGET);
}

bool Action::executeUse(Player* player, Item* item, const Position& fromPosition, Thing* target, const Position& toPosition, bool isHotkey)
{
	//onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (!scriptInterface->reserveScriptEnv()) {
		std::cout << "[Error - Action::executeUse] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface->getScriptEnv();
	env->setScriptId(scriptId, scriptInterface);

	lua_State* L = scriptInterface->getLuaState();

	scriptInterface->pushFunction(scriptId);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushThing(L, item);
	LuaScriptInterface::pushPosition(L, fromPosition);

	LuaScriptInterface::pushThing(L, target);
	LuaScriptInterface::pushPosition(L, toPosition);

	LuaScriptInterface::pushBoolean(L, isHotkey);
	return scriptInterface->callFunction(6);
}
