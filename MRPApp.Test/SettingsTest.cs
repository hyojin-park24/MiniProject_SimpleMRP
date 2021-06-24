using Microsoft.VisualStudio.TestTools.UnitTesting;
using MRPApp.View.Setting;
using System;
using System.Linq;

namespace MRPApp.Test
{
    [TestClass]
    public class SettingsTest
    {
        //DB에 중복된 데이터 있는지 테스트
        [TestMethod]
        public void IsDuplicateDataTest()
        {
            var expectVal = true;
            var inputCode = "PC010001";

            var code = Logic.DataAccess.GetSettings().Where(d => d.BasicCode.Contains(inputCode)).FirstOrDefault();
            var realVal = code != null ? true : false;

            Assert.AreEqual(expectVal, realVal);        //같으면 Pass, 다르면 Fail
        }

        [TestMethod]
        public void IsCodeSearched()
        {
            var expectVal = 2;
            var inputCode = "설비";

            var realVar = Logic.DataAccess.GetSettings().Where(d => d.CodeName.Contains(inputCode)).Count();

        }
    }
}
