#include "map/utils/moduleutils.h"
#include "common/logging.h"
#include "common/sql.h"
#include "lua/luautils.h"
#include "utils/itemutils.h"
#include "lua/lua_baseentity.h"
#include "map/utils/charutils.h"
/************************************************************************
 *  Function: setTempHomePoint()
 *  Purpose : Sets a PC's temp homepoint.
 *  Example : player:setHomePoint()
 *  Notes   :
 ************************************************************************/
class homepointtemp : public CPPModule
{
    void OnInit() override // Called just before the server is ready to run.
    {
        lua["CBaseEntity"]["setTempHomePoint"] = [](CLuaBaseEntity* PLuaBaseEntity) -> void
        {
            TracyZoneScoped;
            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();

            if (PEntity->objtype != TYPE_PC)
            {
                return;
            }

            auto* PChar = static_cast<CCharEntity*>(PEntity);

            PChar->profile.home_point.p           = PChar->loc.p;
            PChar->profile.home_point.destination = PChar->getZone();

            const char* fmtQuery = "UPDATE chars \
                            SET hometemp_zone = %u, hometemp_rot = %u, hometemp_x = %.3f, hometemp_y = %.3f, hometemp_z = %.3f \
                            WHERE charid = %u";

            _sql->Query(fmtQuery, PChar->profile.home_point.destination, PChar->profile.home_point.p.rotation, PChar->profile.home_point.p.x,
                        PChar->profile.home_point.p.y, PChar->profile.home_point.p.z, PChar->id);
        };
    }
};
// You must call this to register your module with the program!
REGISTER_CPP_MODULE(homepointtemp);
