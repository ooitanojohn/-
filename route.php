<?php

use App\Board\Classes\middlewares\LoginCheck;
use App\Board\Classes\controllers\ReportController;
use App\Board\Classes\controllers\LoginController;
use App\Board\Classes\controllers\UserController;

// ログイン画面表示処理
$app->get("/", LoginController::class . ":goLogin");
$app->post("/login", LoginController::class . ":login");
$app->get("/logout", LoginController::class . ":logout");


// userProfile表示処理
$app->get('/user/profile', UserController::class . ":showProfile");
// user作成画面処理
$app->get("/user/goAdd", UserController::class . ":goAdd");
// user登録処理
$app->post("/user/add", UserController::class . ":add");
// user編集画面処理
$app->get('/user/prepareEdit', UserController::class . ':prepareEdit');
// user更新処理
$app->put('/user/edit', UserController::class . ':edit');


// レポートリスト表示処理
$app->get('/reports/showList', ReportController::class . ':showList')->add(new LoginCheck());
$app->get('/reports/showList/{page}', ReportController::class . ':showList')->add(new LoginCheck());
// レポート登録画面表示処理
$app->get('/reports/goAdd', ReportController::class . ':goAdd')->add(new LoginCheck());
// レポート登録処理
$app->post('/reports/add', ReportController::class . ':add')->add(new LoginCheck());
// レポート詳細表示処理
$app->get('/reports/showDetail/{id}', ReportController::class . ':showDetail')->add(new LoginCheck());
// レポート編集画面商事処理
$app->get('/reports/prepareEdit/{id}', ReportController::class . ':prepareEdit')->add(new LoginCheck());
// レポート更新処理
$app->post('/reports/edit/{id}', ReportController::class . ':edit')->add(new LoginCheck());
// レポート削除確認表示処理
$app->get('/reports/confirmDelete/{id}', ReportController::class . ':confirmDelete')->add(new LoginCheck());
// レポート削除処理
$app->post('/reports/delete/{id}', ReportController::class . ':delete')->add(new LoginCheck());
