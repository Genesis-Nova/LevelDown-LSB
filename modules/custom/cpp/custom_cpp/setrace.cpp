#include "common/logging.h"
#include "common/sql.h"
#include "lua/lua_baseentity.h"
#include "lua/luautils.h"
#include "map/utils/charutils.h"
#include "map/utils/moduleutils.h"
/************************************************************************
 *  Function: setRace()
 *  Purpose : Sets a PC's Race.
 *  Example : player:setRace()
 *  Notes   :
 ************************************************************************/
class SetRace : public CPPModule
{
    void OnInit() override // Called just before the server is ready to run.
    {
            lua["CBaseEntity"]["setRace"] = [](CLuaBaseEntity* PLuaBaseEntity, int8 race) -> void
            {
                TracyZoneScoped;

                CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
                if (PEntity->objtype != TYPE_PC)
                {
                    ShowWarning("Invalid entity type calling function (%s).", PEntity->getName());
                    return;
                }
                auto*       PChar = static_cast<CCharEntity*>(PEntity);
                const char* Query = "UPDATE char_look SET race = %u WHERE charid = %u";
                _sql->Query(Query, race, PChar->id);
            };
    }
};
// You must call this to register your module with the program!
REGISTER_CPP_MODULE(SetRace);