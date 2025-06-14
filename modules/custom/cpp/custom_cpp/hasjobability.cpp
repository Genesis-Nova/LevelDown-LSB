#include "common/logging.h"
#include "common/sql.h"
#include "lua/lua_baseentity.h"
#include "lua/luautils.h"
#include "map/utils/charutils.h"
#include "map/utils/moduleutils.h"
/************************************************************************
 *  Function: setRace()
 *  Purpose : Returned true is the player has a job ability
 *  Example : player:hasJobAbility()
 *  Notes   :
 ************************************************************************/
class hasjobability : public CPPModule
{
    void OnInit() override // Called just before the server is ready to run.
    {
            lua["CBaseEntity"]["hasJobAbility"] = [](CLuaBaseEntity* PLuaBaseEntity, uint16 abilityID) -> bool
            {
                TracyZoneScoped;

                CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
                if (PEntity->objtype != TYPE_PC)
                {
                    ShowWarning("Invalid entity type calling function (%s).", PEntity->getName());
                    return false;
                }
            return charutils::hasAbility(static_cast<CCharEntity*>(PEntity), abilityID) != 0;
            };
    }
};
// You must call this to register your module with the program!
REGISTER_CPP_MODULE(hasjobability);