using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MRPApp.Model;

namespace MRPApp.Logic
{
    public class DataAccess
    {
        
        //셋팅 테이블에서 데이터 가져오기
        internal static List<Settings> GetSettings()    //internal : 같은 어셈블리 내에서는 public으로 적용됨
        {
            List<Model.Settings> settings;
            using (var ctx = new MRPEntities()) // MRPEntities가 데이터베이스 연결해주는 것
                settings = ctx.Settings.ToList();

            return settings;
        }

        internal static int SetSettings(Settings item)
        {
            using (var ctx = new MRPEntities())
            {
                ctx.Settings.AddOrUpdate(item);
                return ctx.SaveChanges();
            }
        }

        internal static int DelSetting(Settings item)
        {
            using (var ctx = new MRPEntities())
            {
                var obj = ctx.Settings.Find(item.BasicCode);
                ctx.Settings.Remove(obj);       //DELET
                return ctx.SaveChanges();
            }
        }
    }
}
