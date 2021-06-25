﻿using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MRPApp.View;
using MRPApp.View.Account;
using MRPApp.View.Setting;
using MRPApp.View.Schedule;

namespace MRPApp
{
    /// <summary>
    /// MainWindow.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class MainWindow : MetroWindow
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //private void MetroWindow_ContentRendered(object sender, EventArgs e)
        //{
        //    ShowLoginView();
        //}

        //private void MetroWindow_Activated(object sender, EventArgs e)
        //{
        //    if (Commons.LOGINED_USER != null)
        //        BtnLoginedId.Content = $"{Commons.LOGINED_USER.UserEmail} ({Commons.LOGINED_USER.UserName})";
        //}

        //private async void BtnLogOut_Click(object sender, RoutedEventArgs e)
        //{
        //    // TODO : 모든 화면을 해제하고 첫화면으로 돌려놔야 함.

        //    var result = await this.ShowMessageAsync("로그아웃", "로그아웃하시겠습니까?",
        //        MessageDialogStyle.AffirmativeAndNegative, null);

        //    if (result == MessageDialogResult.Affirmative)
        //    {
        //        Commons.LOGINED_USER = null; // 로그인했던 사용자 정보를 삭제
        //        ShowLoginView();
        //    }
        //}

        //private void ShowLoginView()
        //{
        //    LoginView view = new LoginView();
        //    view.Owner = this;
        //    view.WindowStartupLocation = WindowStartupLocation.CenterOwner;
        //    view.ShowDialog();
        //}
        private async void BtnExit_Click(object sender, RoutedEventArgs e)
        {
            var result = await this.ShowMessageAsync("종료","프로그램을 종료하시겠습니까?",
                                    MessageDialogStyle.AffirmativeAndNegative, null);

            if (result == MessageDialogResult.Affirmative)
                Application.Current.Shutdown();
        }

        private void BtnSetting_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ActiveControl.Content = new SettingList();
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 BtnSetting_Click : {ex}");
                this.ShowMessageAsync("예외", $"예외발생 : {ex}");
            }
        }

        private void Btnshcedul_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ActiveControl.Content = new ScheduleList();
            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 BtnSetting_Click : {ex}");
                this.ShowMessageAsync("예외", $"예외발생 : {ex}");
            }
        }
    }
}
