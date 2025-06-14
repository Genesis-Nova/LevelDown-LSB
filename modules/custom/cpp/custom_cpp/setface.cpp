#include "common/logging.h"
#include "common/sql.h"
#include "lua/lua_baseentity.h"
#include "lua/luautils.h"
#include "map/utils/charutils.h"
#include "map/utils/moduleutils.h"
/************************************************************************
 *  Function: setFace()
 *  Purpose : Sets a PC's Face.
 *  Example : player:setFace()
 *  Notes   :
 ************************************************************************/
class SetFace : public CPPModule
{
    void OnInit() override // Called just before the server is ready to run.
    {
        lua["CBaseEntity"]["setFace"] = [](CLuaBaseEntity* PLuaBaseEntity, int8 face) -> void
        {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();
            if (PEntity->objtype != TYPE_PC)
            {
                ShowWarning("Invalid entity type calling function (%s).", PEntity->getName());
                return;
            }
            auto*       PChar = static_cast<CCharEntity*>(PEntity);
            const char* Query = "UPDATE char_look SET face = %u WHERE charid = %u";
            _sql->Query(Query, face, PChar->id);
        };
    }
};
// You must call this to register your module with the program!
REGISTER_CPP_MODULE(SetFace);