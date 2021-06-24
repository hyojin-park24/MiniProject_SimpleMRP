using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.Win32;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace MRPApp.View.Schedule
{
    /// <summary>
    /// MyAccount.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class ScheduleList : Page
    {
        public ScheduleList()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                //페이지 딱 켰을 때 로드
                LoadGridData();

                //에러메시지 숨기기 초기화
                InitErrorMessage();
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 StoreList Loaded : {ex}");
                throw ex;
            }
        }
        private void InitErrorMessage()
        {
            LblBasicCode.Visibility = LblCodeDesc.Visibility = LblCodeName.Visibility = Visibility.Hidden;
        }

        private void LoadGridData()
        {
            List<Model.Settings> settings = Logic.DataAccess.GetSettings();
            this.DataContext = settings;
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            ClearInputs();
        }

        private async void BtnInsert_Click(object sender, RoutedEventArgs e)
        {
            IsValidInputs();
            var setting = new Model.Settings();
            setting.BasicCode = TxtBasiCode.Text;
            setting.CodeName = TxtCodeNAme.Text;
            setting.CodeDesc = TxtCodeDesc.Text;
            setting.RegDate = DateTime.Now;
            setting.RegID = "MRP";

            try
            {
                var result = Logic.DataAccess.SetSettings(setting);
                if (result == 0)
                {
                    Commons.LOGGER.Error("데이터 수정시 오류 발생");
                    await Commons.ShowMessageAsync("오류", "데이터 수정 실패!!");
                }
                else
                {
                    Commons.LOGGER.Info($"데이터 수정 성공 : {setting.BasicCode}");
                    ClearInputs();
                    LoadGridData();
                }
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생{ex}");
            }
        }

        //입력데이터 검증 메서드
        public bool IsValidInputs()
        {
            var isValid = true;
            InitErrorMessage();

            if(string.IsNullOrEmpty(TxtBasiCode.Text))
            {
                LblBasicCode.Visibility = Visibility.Visible;
                LblBasicCode.Text = "코드를 입력하세요";
                isValid = false;
            }
            else if (Logic.DataAccess.GetSettings().Where(s => s.BasicCode.Equals(TxtBasiCode.Text)).Count() > 0)
            {
                LblBasicCode.Visibility = Visibility.Visible;
                LblBasicCode.Text = "중복코드가 존재합니다";
                isValid = false;
            }

            if (string.IsNullOrEmpty(TxtCodeNAme.Text))
            {
                LblCodeName.Visibility = Visibility.Visible;
                LblCodeName.Text = "코드명을 입력하세요";
                isValid = false;
            }
            return IsValidInputs();
        }

        private async void BtnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var setting = GrdData.SelectedItem as Model.Settings;
            setting.CodeName = TxtCodeNAme.Text;
            setting.CodeDesc = TxtCodeDesc.Text;
            setting.ModDate = DateTime.Now;
            setting.ModID = "MRP";

            try
            {
                var result = Logic.DataAccess.SetSettings(setting);
                if (result == 0)
                {
                    Commons.LOGGER.Error("데이터 수정시 오류 발생");
                    await Commons.ShowMessageAsync("오류", "데이터 수정 실패!!");
                }
                else
                {
                    Commons.LOGGER.Info($"데이터 수정 성공 : {setting.BasicCode}");
                    ClearInputs();
                    LoadGridData();
                }
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생{ex}");
            }
        }

        private void ClearInputs()
        {
            TxtBasiCode.IsReadOnly = false;
            TxtBasiCode.Background = new SolidColorBrush(Colors.White);

            TxtBasiCode.Text = TxtCodeNAme.Text = TxtCodeDesc.Text = string.Empty;
            TxtBasiCode.Focus();
        }

        private void BtnSerch_Click(object sender, RoutedEventArgs e)
        {
            var search = TxtSerch.Text.Trim();

            var settings = Logic.DataAccess.GetSettings().Where(s => s.CodeName.Contains(search)).ToList();
            this.DataContext = settings;
        }

        private void GrdData_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            try
            {
                var setting = GrdData.SelectedItem as Model.Settings;
                TxtBasiCode.Text = setting.BasicCode;
                TxtCodeNAme.Text = setting.CodeName;
                TxtCodeDesc.Text = setting.CodeDesc;

                TxtBasiCode.IsReadOnly = true;
                TxtBasiCode.Background = new SolidColorBrush(Colors.LightGray);
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 {ex}");
                ClearInputs();
            }
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var setting = GrdData.SelectedItem as Model.Settings;

            if(setting == null)
            {
                await Commons.ShowMessageAsync("삭제", "삭제할 코드를 선택하세요");
                return;
            }
            else
            {
                try
                {
                    var result = Logic.DataAccess.DelSetting(setting);
                    if (result == 0)
                    {
                        Commons.LOGGER.Error("데이터 삭제시 오류 발생");
                        await Commons.ShowMessageAsync("오류", "데이터 삭제 실패!!");
                    }
                    else
                    {
                        Commons.LOGGER.Info($"데이터 삭제 성공 : {setting.BasicCode}");
                        ClearInputs();
                        LoadGridData();
                    }
                }
                catch (Exception ex)
                {
                    Commons.LOGGER.Error($"예외발생 {ex}");
                }
                
            }
        }

        private void TxtSerch_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if (e.Key == System.Windows.Input.Key.Enter)
                BtnSerch_Click(sender, e);
        }
    }
}
