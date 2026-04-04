--[[
══════════════════════════════════════════════════════════════════
Neo's Hub v3.0 — Universal Roblox Menu
Author: @mrneoner
Discord: mrneoner | Telegram: wantpepa
GitHub: mrneoner1337 | Roblox: LegoSurgeon
══════════════════════════════════════════════════════════════════
]]--

-- ═══ УСТАНОВКА ИСТОЧНИКА ДЛЯ RELOAD ═══
if not _G.NesficateHubSource then
	_G.NesficateHubSource = "https://raw.githubusercontent.com/mrneoner1337/Neo-Hub-Loader/main/neoloader.lua"
end

-- Сохранить ссылку в файл
pcall(function()
	local ConfigDir = "NeoHub"
	if not isfolder(ConfigDir) then makefolder(ConfigDir) end
	writefile(ConfigDir.."/reload_source.txt", _G.NesficateHubSource)
end)

-- ═══ SERVICES ═══
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local ProtectGui = (syn and syn.protect_gui) or (gethui and function(g) g.Parent = gethui() end) or function() end

local function getChar() return Player.Character or Player.CharacterAdded:Wait() end
local function getHum() return getChar():WaitForChild("Humanoid") end
local function getRoot() return getChar():WaitForChild("HumanoidRootPart") end

-- ═══ STORE SCRIPT SOURCE FOR RELOAD ═══
if not _G.NesficateHubSource then
	_G.NesficateHubSource = "https://raw.githubusercontent.com/mrneoner1337/Neo-Hub-Loader/main/neoloader.lua"
end

pcall(function()
	if not isfolder("NeoHub") then makefolder("NeoHub") end
	writefile("NeoHub/reload_source.txt", _G.NesficateHubSource)
end)

-- ═══════════════════════════════════════════
-- LOCALIZATION
-- ═══════════════════════════════════════════
local Langs = {
	EN = {
		hub_name = "Neo's Hub",
		version = "v3.0 — Universal Menu",
		loading = "Loading...",
		loading_init = "Initializing modules...",
		loading_gui = "Building interface...",
		loading_hooks = "Setting up hooks...",
		loading_done = "Ready!",
		loading_welcome = "Welcome, %s",
		tab_movement = "Movement",
		tab_visual = "Visual",
		tab_misc = "Misc",
		tab_settings = "Settings",
		tab_themes = "Themes",
		tab_credits = "Credits",
		fly = "Fly",
		fly_speed = "Fly Speed",
		speed_override = "Speed Override",
		walkspeed = "WalkSpeed",
		jump_override = "Jump Override",
		jumppower = "JumpPower",
		inf_jump = "Infinite Jump",
		noclip = "Noclip",
		esp = "Enable ESP",
		esp_names = "Show Names",
		esp_health = "Show Health",
		esp_team = "Team Check",
		esp_dist = "ESP Distance",
		esp_fill = "Fill Transparency",
		esp_tracers = "Tracers",
		esp_rainbow = "Rainbow ESP",
		esp_boxes = "Box ESP",
		esp_preview = "ESP Preview - Rewriting",
		fullbright = "Fullbright",
		no_fog = "No Fog",
		anti_lag = "Anti Lag",
		stun = "Stun (Freeze)",
		ragdoll = "Ragdoll",
		give_all_tools = "Give All Tools",
		enable_inventory = "Enable Inventory",
		enable_shiftlock = "Enable Shiftlock",
		click_tp = "Click TP (Ctrl+Click)",
		anti_afk = "Anti AFK",
		open_iy = "Open Infinite Yield",
		open_dex = "Open Dex Explorer",
		open_spy = "Open Remote Spy",
		open_owl = "Open Owl Hub",
		btools = "BTools",
		btools_delete = "BTools — Hammer",
		btools_copy = "BTools — Clone",
		btools_replace = "BTools — Grab",
		btools_all = "BTools — Give All",
		tp_tool = "TP Tool",
		config_name = "Config name...",
		save_config = "Save Config",
		load_config = "Load Config",
		delete_config = "Delete Config",
		list_configs = "List Configs",
		refresh_configs = "Refresh List",
		autoload = "Auto-Load Config",
		autoload_set = "Set as Auto-Load",
		select_config = "Select Config",
		server_hop = "Server Hop",
		rejoin = "Rejoin Server",
		language = "Language",
		theme = "Theme",
		theme_presets = "Theme Presets",
		theme_editor = "Theme Editor",
		configs = "Config System",
		configs_dir = "Configs saved to:",
		server = "Server",
		info = "Info",
		developer = "Developer",
		changelog = "Changelog",
		disclaimer = "⚠ Disclaimer",
		disc_text1 = "Use at your own risk. Not responsible for bans.",
		disc_text2 = "Educational purposes only.",
		made_with = "Made with love by @mrneoner",
		sect_player = "Player Actions",
		sect_inventory = "Inventory & Features",
		sect_teleport = "Teleport",
		sect_tools = "Tools",
		sect_server = "Server",
		sect_scripts = "External Scripts",
		sect_anti = "Protection",
		sect_fly = "Fly",
		sect_walk = "Walk Speed",
		sect_jump = "Jump Power",
		sect_infjump = "Infinite Jump",
		sect_noclip = "Noclip",
		sect_esp = "ESP",
		sect_lighting = "Lighting",
		no_configs = "No configs found",
		saved = "saved!",
		loaded = "loaded!",
		deleted = "deleted!",
		unlocked_tools = "Gave %d tools!",
		toggle_hint = "Press %s to toggle menu.",
		close = "Close",
		minimize = "Minimize",
		select_lang = "Select Language",
		keybinds = "Keybinds",
		toggle_key = "Toggle Menu Key",
		press_key = "Press a key...",
		panic = "Panic (Unload All)",
		panic_desc = "Unload everything",
		reset_char = "Reset Character",
		reload_menu = "Reload Menu",
		sect_keybinds = "Keybinds",
		sect_reset = "Character",
		sect_reload = "Menu",
		sect_danger = "Danger Zone",
		copied = "Copied to clipboard!",
		particles = "Background Particles",
		particles_none = "None",
		particles_snow = "Snowflakes",
		particles_stars = "Stars",
		particles_hearts = "Hearts",
		particles_bubbles = "Bubbles",
		particles_rain = "Rain",
		show_keybind_panel = "Show Keybind Panel",
		keybind_panel = "Keybind Panel",
		set_keybind = "Set Keybind",
		right_click_hint = "Right-click any toggle/button to set keybind",
		no_keybinds = "No keybinds set",
		on = "ON",
		off = "OFF",
		reloading = "Reloading...",
		reload_fail = "Reload failed. Use: _G.NesficateHubSource = 'your_url' before first load.",
		clear_all_keybinds = "Clear All Keybinds",
		hidden_hint = "Menu hidden! Press %s to show.",
		accent_color = "Accent Color",
		bg_color = "Background Color",
		sidebar_color = "Sidebar Color",
		card_color = "Card Color",
		text_color = "Text Color",
		subtext_color = "Subtext Color",
		danger_color = "Danger Color",
		configs_path = "Configs path:",
		keybind_already_used = "Key '%s' is already used by '%s'!",
		sect_screen_info = "Screen Info",
		fps_counter = "FPS Counter",
		coordinates = "Coordinates",
		sect_camera = "Camera",
		chams = "Chams (Surface GUI)",
		crosshair = "Crosshair",
		crosshair_color = "Crosshair Color",
		crosshair_size = "Crosshair Size",
		crosshair_thickness = "Crosshair Thickness",
		fov_changer = "FOV Changer",
		day_night_cycle = "Day/Night Cycle",
		custom_skybox = "Custom Skybox",
		orbit_player = "Orbit Player",
		orbit_speed = "Orbit Speed",
		orbit_distance = "Orbit Distance",
		select_player = "Select Player",
		sect_orbit = "Orbit",
		experimental = "Experimental",
		blur_background = "Blur Background (Experimental)",
		blur_hint = "⚠ Experimental: Uses blur instead of darkening",
		custom_themes = "Custom Themes",
		save_theme = "Save Theme",
		load_theme = "Load Theme",
		delete_theme = "Delete Theme",
		theme_name = "Theme name...",
		select_theme = "Select Theme",
		resize_hint = "Drag corner to resize",
		fps_unlocker = "FPS Unlocker",
		max_zoom = "Max Camera Zoom",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Fling Power",
		walk_fling = "Walk Fling",
		fly_fling = "Fly Fling",
		spin = "Spin",
		spin_speed = "Spin Speed",
	},
	RU = {
		hub_name = "Neo's Hub",
		version = "v3.0 — Универсальное меню",
		loading = "Загрузка...",
		loading_init = "Инициализация модулей...",
		loading_gui = "Построение интерфейса...",
		loading_hooks = "Настройка хуков...",
		loading_done = "Готово!",
		loading_welcome = "Добро пожаловать, %s",
		tab_movement = "Движение",
		tab_visual = "Визуал",
		tab_misc = "Разное",
		tab_settings = "Настройки",
		tab_themes = "Темы",
		tab_credits = "Авторы",
		fly = "Полёт",
		fly_speed = "Скорость полёта",
		speed_override = "Изменить скорость",
		walkspeed = "Скорость ходьбы",
		jump_override = "Изменить прыжок",
		jumppower = "Сила прыжка",
		inf_jump = "Бесконечный прыжок",
		noclip = "Ноклип",
		esp = "Включить ESP",
		esp_names = "Показать имена",
		esp_health = "Показать здоровье",
		esp_team = "Проверка команды",
		esp_dist = "Дистанция ESP",
		esp_fill = "Прозрачность заливки",
		esp_tracers = "Трейсеры",
		esp_rainbow = "Радужный ESP",
		esp_boxes = "Коробочный ESP",
		esp_preview = "Предпросмотр ESP - Реворк",
		fullbright = "Полная яркость",
		no_fog = "Без тумана",
		anti_lag = "Анти-Лаг",
		stun = "Стан (Заморозка)",
		ragdoll = "Рэгдолл",
		give_all_tools = "Выдать все инструменты",
		enable_inventory = "Включить инвентарь",
		enable_shiftlock = "Включить шифтлок",
		click_tp = "Клик ТП (Ctrl+Клик)",
		anti_afk = "Анти-АФК",
		open_iy = "Открыть Infinite Yield",
		open_dex = "Открыть Dex Explorer",
		open_spy = "Открыть Remote Spy",
		open_owl = "Открыть Owl Hub",
		btools = "BTools",
		btools_delete = "BTools — Молоток",
		btools_copy = "BTools — Клонировать",
		btools_replace = "BTools — Захват",
		btools_all = "BTools — Выдать все",
		tp_tool = "TP Tool",
		config_name = "Имя конфига...",
		save_config = "Сохранить конфиг",
		load_config = "Загрузить конфиг",
		delete_config = "Удалить конфиг",
		list_configs = "Список конфигов",
		refresh_configs = "Обновить список",
		autoload = "Авто-загрузка конфига",
		autoload_set = "Установить авто-загрузку",
		select_config = "Выбрать конфиг",
		server_hop = "Сменить сервер",
		rejoin = "Перезайти",
		language = "Язык",
		theme = "Тема",
		theme_presets = "Пресеты тем",
		theme_editor = "Редактор темы",
		configs = "Система конфигов",
		configs_dir = "Конфиги сохранены в:",
		server = "Сервер",
		info = "Информация",
		developer = "Разработчик",
		changelog = "Изменения",
		disclaimer = "Отказ от ответственности",
		disc_text1 = "Используйте на свой страх и риск.",
		disc_text2 = "Только в образовательных целях.",
		made_with = "Сделано с любовью от @mrneoner",
		sect_player = "Действия игрока",
		sect_inventory = "Инвентарь и функции",
		sect_teleport = "Телепортация",
		sect_tools = "Инструменты",
		sect_server = "Сервер",
		sect_scripts = "Внешние скрипты",
		sect_anti = "Защита",
		sect_fly = "Полёт",
		sect_walk = "Скорость ходьбы",
		sect_jump = "Сила прыжка",
		sect_infjump = "Бесконечный прыжок",
		sect_noclip = "Ноклип",
		sect_esp = "ESP",
		sect_lighting = "Освещение",
		no_configs = "Конфиги не найдены",
		saved = "сохранён!",
		loaded = "загружен!",
		deleted = "удалён!",
		unlocked_tools = "Выдано %d инструментов!",
		toggle_hint = "Нажмите %s для открытия меню.",
		close = "Закрыть",
		minimize = "Свернуть",
		select_lang = "Выберите язык",
		keybinds = "Клавиши",
		toggle_key = "Клавиша меню",
		press_key = "Нажмите клавишу...",
		panic = "Паника (Выгрузить всё)",
		panic_desc = "Выгрузить всё",
		reset_char = "Сбросить персонажа",
		reload_menu = "Перезагрузить меню",
		sect_keybinds = "Клавиши",
		sect_reset = "Персонаж",
		sect_reload = "Меню",
		sect_danger = "Опасная зона",
		copied = "Скопировано!",
		particles = "Частицы на фоне",
		particles_none = "Нет",
		particles_snow = "Снежинки",
		particles_stars = "Звёзды",
		particles_hearts = "Сердечки",
		particles_bubbles = "Пузыри",
		particles_rain = "Дождь",
		show_keybind_panel = "Показать панель клавиш",
		keybind_panel = "Панель клавиш",
		set_keybind = "Задать клавишу",
		right_click_hint = "ПКМ по переключателю/кнопке для назначения клавиши",
		no_keybinds = "Клавиши не заданы",
		on = "ВКЛ",
		off = "ВЫКЛ",
		reloading = "Перезагрузка...",
		reload_fail = "Перезагрузка не удалась. Используйте: _G.NesficateHubSource = 'ваш_url' перед первой загрузкой.",
		clear_all_keybinds = "Сбросить все клавиши",
		hidden_hint = "Меню скрыто! Нажмите %s чтобы показать.",
		accent_color = "Акцентный цвет",
		bg_color = "Цвет фона",
		sidebar_color = "Цвет панели",
		card_color = "Цвет карточек",
		text_color = "Цвет текста",
		subtext_color = "Цвет подтекста",
		danger_color = "Цвет опасности",
		configs_path = "Путь к конфигам:",
		keybind_already_used = "Клавиша '%s' уже используется для '%s'!",
		sect_screen_info = "Информация на экране",
		fps_counter = "Счётчик FPS",
		coordinates = "Координаты",
		sect_camera = "Камера",
		chams = "Chams (Surface GUI)",
		crosshair = "Прицел",
		crosshair_color = "Цвет прицела",
		crosshair_size = "Размер прицела",
		crosshair_thickness = "Толщина прицела",
		fov_changer = "Изменить FOV",
		day_night_cycle = "Цикл дня/ночи",
		custom_skybox = "Кастомный скайбокс",
		orbit_player = "Орбита игрока",
		orbit_speed = "Скорость орбиты",
		orbit_distance = "Дистанция орбиты",
		select_player = "Выбрать игрока",
		sect_orbit = "Орбита",
		experimental = "Экспериментальное",
		blur_background = "Размытие фона (Эксперим.)",
		blur_hint = "⚠ Экспериментально: Блюр вместо затемнения",
		custom_themes = "Кастомные темы",
		save_theme = "Сохранить тему",
		load_theme = "Загрузить тему",
		delete_theme = "Удалить тему",
		theme_name = "Имя темы...",
		select_theme = "Выбрать тему",
		resize_hint = "Тяните за угол для изменения размера",
		fps_unlocker = "Разблокировка FPS",
		max_zoom = "Макс. зум камеры",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Сила Fling",
		walk_fling = "Walk Fling",
		fly_fling = "Fly Fling",
		spin = "Spin",
		spin_speed = "Скорость Spin",
	},
	JP = {
		hub_name = "Neo's Hub",
		version = "v3.0 — ユニバーサルメニュー",
		loading = "読み込み中...",
		loading_init = "モジュールを初期化中...",
		loading_gui = "インターフェースを構築中...",
		loading_hooks = "フックを設定中...",
		loading_done = "準備完了！",
		loading_welcome = "ようこそ、%s",
		tab_movement = "移動",
		tab_visual = "ビジュアル",
		tab_misc = "その他",
		tab_settings = "設定",
		tab_themes = "テーマ",
		tab_credits = "クレジット",
		fly = "フライ",
		fly_speed = "フライ速度",
		speed_override = "速度変更",
		walkspeed = "歩行速度",
		jump_override = "ジャンプ変更",
		jumppower = "ジャンプ力",
		inf_jump = "無限ジャンプ",
		noclip = "ノークリップ",
		esp = "ESP有効化",
		esp_names = "名前表示",
		esp_health = "体力表示",
		esp_team = "チームチェック",
		esp_dist = "ESP距離",
		esp_fill = "塗りつぶし透明度",
		esp_tracers = "トレーサー",
		esp_rainbow = "レインボーESP",
		esp_boxes = "ボックスESP",
		esp_preview = "ESPプレビュー - 手直し",
		fullbright = "フルブライト",
		no_fog = "霧なし",
		anti_lag = "アンチラグ",
		stun = "スタン（凍結）",
		ragdoll = "ラグドール",
		give_all_tools = "全ツール付与",
		enable_inventory = "インベントリ有効化",
		enable_shiftlock = "シフトロック有効化",
		click_tp = "クリックTP（Ctrl+クリック）",
		anti_afk = "アンチAFK",
		open_iy = "Infinite Yieldを開く",
		open_dex = "Dex Explorerを開く",
		open_spy = "Remote Spyを開く",
		open_owl = "Owl Hubを開く",
		btools = "BTools",
		btools_delete = "BTools — ハンマー",
		btools_copy = "BTools — クローン",
		btools_replace = "BTools — グラブ",
		btools_all = "BTools — 全て付与",
		tp_tool = "TPツール",
		config_name = "設定名...",
		save_config = "設定を保存",
		load_config = "設定を読込",
		delete_config = "設定を削除",
		list_configs = "設定一覧",
		refresh_configs = "リスト更新",
		autoload = "自動読込設定",
		autoload_set = "自動読込に設定",
		select_config = "設定を選択",
		server_hop = "サーバー移動",
		rejoin = "再参加",
		language = "言語",
		theme = "テーマ",
		theme_presets = "テーマプリセット",
		theme_editor = "テーマエディター",
		configs = "設定システム",
		configs_dir = "保存先：",
		server = "サーバー",
		info = "情報",
		developer = "開発者",
		changelog = "変更履歴",
		disclaimer = "免責事項",
		disc_text1 = "自己責任でご利用ください。",
		disc_text2 = "教育目的のみ。",
		made_with = "@mrneonerが愛を込めて制作",
		sect_player = "プレイヤーアクション",
		sect_inventory = "インベントリと機能",
		sect_teleport = "テレポート",
		sect_tools = "ツール",
		sect_server = "サーバー",
		sect_scripts = "外部スクリプト",
		sect_anti = "保護",
		sect_fly = "フライ",
		sect_walk = "歩行速度",
		sect_jump = "ジャンプ力",
		sect_infjump = "無限ジャンプ",
		sect_noclip = "ノークリップ",
		sect_esp = "ESP",
		sect_lighting = "ライティング",
		no_configs = "設定が見つかりません",
		saved = "保存しました！",
		loaded = "読み込みました！",
		deleted = "削除しました！",
		unlocked_tools = "%d個のツールを付与！",
		toggle_hint = "%sでメニュー切替。",
		close = "閉じる",
		minimize = "最小化",
		select_lang = "言語を選択",
		keybinds = "キーバインド",
		toggle_key = "メニュー切替キー",
		press_key = "キーを押してください...",
		panic = "パニック（全アンロード）",
		panic_desc = "全てアンロード",
		reset_char = "キャラクターリセット",
		reload_menu = "メニュー再読込",
		sect_keybinds = "キーバインド",
		sect_reset = "キャラクター",
		sect_reload = "メニュー",
		sect_danger = "危険ゾーン",
		copied = "コピーしました！",
		particles = "背景パーティクル",
		particles_none = "なし",
		particles_snow = "雪",
		particles_stars = "星",
		particles_hearts = "ハート",
		particles_bubbles = "泡",
		particles_rain = "雨",
		show_keybind_panel = "キーバインドパネル表示",
		keybind_panel = "キーバインドパネル",
		set_keybind = "キー設定",
		right_click_hint = "右クリックでキーバインド設定",
		no_keybinds = "キーバインド未設定",
		on = "ON",
		off = "OFF",
		reloading = "再読込中...",
		reload_fail = "再読込失敗。最初の読み込み前に_G.NesficateHubSource='URL'を設定。",
		clear_all_keybinds = "全キーバインド消去",
		hidden_hint = "メニュー非表示！%sで表示。",
		accent_color = "アクセントカラー",
		bg_color = "背景色",
		sidebar_color = "サイドバー色",
		card_color = "カード色",
		text_color = "テキスト色",
		subtext_color = "サブテキスト色",
		danger_color = "危険色",
		configs_path = "設定パス:",
		keybind_already_used = "キー '%s' は '%s' で使用中！",
		sect_screen_info = "画面情報",
		fps_counter = "FPSカウンター",
		coordinates = "座標",
		sect_camera = "カメラ",
		chams = "Chams (Surface GUI)",
		crosshair = "クロスヘア",
		crosshair_color = "クロスヘア色",
		crosshair_size = "クロスヘアサイズ",
		crosshair_thickness = "クロスヘア太さ",
		fov_changer = "FOV変更",
		day_night_cycle = "昼夜サイクル",
		custom_skybox = "カスタムスカイボックス",
		orbit_player = "プレイヤー周回",
		orbit_speed = "周回速度",
		orbit_distance = "周回距離",
		select_player = "プレイヤー選択",
		sect_orbit = "オービット",
		experimental = "実験的",
		blur_background = "背景ブラー（実験的）",
		blur_hint = "⚠ 実験的: 暗転の代わりにブラー",
		custom_themes = "カスタムテーマ",
		save_theme = "テーマ保存",
		load_theme = "テーマ読込",
		delete_theme = "テーマ削除",
		theme_name = "テーマ名...",
		select_theme = "テーマ選択",
		resize_hint = "角をドラッグしてリサイズ",
		fps_unlocker = "FPSアンロッカー",
		max_zoom = "最大カメラズーム",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Fling力",
		walk_fling = "Walk Fling",
		fly_fling = "Fly Fling",
		spin = "Spin",
		spin_speed = "Spin速度",
	},
	ES = {
		hub_name = "Neo's Hub",
		version = "v3.0 — Menú Universal",
		loading = "Cargando...",
		loading_init = "Inicializando módulos...",
		loading_gui = "Construyendo interfaz...",
		loading_hooks = "Configurando hooks...",
		loading_done = "¡Listo!",
		loading_welcome = "Bienvenido, %s",
		tab_movement = "Movimiento",
		tab_visual = "Visual",
		tab_misc = "Varios",
		tab_settings = "Ajustes",
		tab_themes = "Temas",
		tab_credits = "Créditos",
		fly = "Volar",
		fly_speed = "Velocidad de vuelo",
		speed_override = "Cambiar velocidad",
		walkspeed = "Vel. de caminar",
		jump_override = "Cambiar salto",
		jumppower = "Fuerza de salto",
		inf_jump = "Salto infinito",
		noclip = "Noclip",
		esp = "Activar ESP",
		esp_names = "Mostrar nombres",
		esp_health = "Mostrar salud",
		esp_team = "Filtro de equipo",
		esp_dist = "Distancia ESP",
		esp_fill = "Transparencia relleno",
		esp_tracers = "Trazadores",
		esp_rainbow = "ESP Arcoíris",
		esp_boxes = "ESP Cajas",
		esp_preview = "Vista previa ESP - Rehacer",
		fullbright = "Brillo completo",
		no_fog = "Sin niebla",
		anti_lag = "Anti Lag",
		stun = "Aturdir (Congelar)",
		ragdoll = "Ragdoll",
		give_all_tools = "Dar todas las herramientas",
		enable_inventory = "Activar inventario",
		enable_shiftlock = "Activar shiftlock",
		click_tp = "Click TP (Ctrl+Click)",
		anti_afk = "Anti AFK",
		open_iy = "Abrir Infinite Yield",
		open_dex = "Abrir Dex Explorer",
		open_spy = "Abrir Remote Spy",
		open_owl = "Abrir Owl Hub",
		btools = "BTools",
		btools_delete = "BTools — Martillo",
		btools_copy = "BTools — Clonar",
		btools_replace = "BTools — Agarrar",
		btools_all = "BTools — Dar todos",
		tp_tool = "Herramienta TP",
		config_name = "Nombre del config...",
		save_config = "Guardar config",
		load_config = "Cargar config",
		delete_config = "Eliminar config",
		list_configs = "Listar configs",
		refresh_configs = "Actualizar lista",
		autoload = "Config auto-carga",
		autoload_set = "Establecer auto-carga",
		select_config = "Seleccionar config",
		server_hop = "Cambiar servidor",
		rejoin = "Reconectar",
		language = "Idioma",
		theme = "Tema",
		theme_presets = "Preajustes de tema",
		theme_editor = "Editor de tema",
		configs = "Sistema de configs",
		configs_dir = "Configs guardados en:",
		server = "Servidor",
		info = "Información",
		developer = "Desarrollador",
		changelog = "Historial",
		disclaimer = "Aviso legal",
		disc_text1 = "Úselo bajo su propio riesgo.",
		disc_text2 = "Solo con fines educativos.",
		made_with = "Hecho con amor por @mrneoner",
		sect_player = "Acciones del jugador",
		sect_inventory = "Inventario y funciones",
		sect_teleport = "Teletransporte",
		sect_tools = "Herramientas",
		sect_server = "Servidor",
		sect_scripts = "Scripts externos",
		sect_anti = "Protección",
		sect_fly = "Vuelo",
		sect_walk = "Vel. de caminar",
		sect_jump = "Fuerza de salto",
		sect_infjump = "Salto infinito",
		sect_noclip = "Noclip",
		sect_esp = "ESP",
		sect_lighting = "Iluminación",
		no_configs = "No se encontraron configs",
		saved = "guardado!",
		loaded = "cargado!",
		deleted = "eliminado!",
		unlocked_tools = "%d herramientas dadas!",
		toggle_hint = "%s para alternar menú.",
		close = "Cerrar",
		minimize = "Minimizar",
		select_lang = "Seleccionar idioma",
		keybinds = "Atajos de teclado",
		toggle_key = "Tecla del menú",
		press_key = "Presione una tecla...",
		panic = "Pánico (Descargar todo)",
		panic_desc = "Descargar todo",
		reset_char = "Reiniciar personaje",
		reload_menu = "Recargar menú",
		sect_keybinds = "Atajos de teclado",
		sect_reset = "Personaje",
		sect_reload = "Menú",
		sect_danger = "Zona de peligro",
		copied = "Copiado!",
		particles = "Partículas de fondo",
		particles_none = "Ninguno",
		particles_snow = "Copos de nieve",
		particles_stars = "Estrellas",
		particles_hearts = "Corazones",
		particles_bubbles = "Burbujas",
		particles_rain = "Lluvia",
		show_keybind_panel = "Mostrar panel de atajos",
		keybind_panel = "Panel de atajos",
		set_keybind = "Asignar tecla",
		right_click_hint = "Clic derecho en toggle/botón para asignar tecla",
		no_keybinds = "Sin atajos asignados",
		on = "ON",
		off = "OFF",
		reloading = "Recargando...",
		reload_fail = "Recarga fallida. Use: _G.NesficateHubSource = 'su_url' antes de la primera carga.",
		clear_all_keybinds = "Borrar todos los atajos",
		hidden_hint = "Menú oculto! Presione %s para mostrar.",
		accent_color = "Color de acento",
		bg_color = "Color de fondo",
		sidebar_color = "Color de barra lateral",
		card_color = "Color de tarjeta",
		text_color = "Color de texto",
		subtext_color = "Color de subtexto",
		danger_color = "Color de peligro",
		configs_path = "Ruta de configs:",
		keybind_already_used = "¡La tecla '%s' ya está usada por '%s'!",
		sect_screen_info = "Info en pantalla",
		fps_counter = "Contador FPS",
		coordinates = "Coordenadas",
		sect_camera = "Cámara",
		chams = "Chams (Surface GUI)",
		crosshair = "Punto de mira",
		crosshair_color = "Color del punto",
		crosshair_size = "Tamaño del punto",
		crosshair_thickness = "Grosor del punto",
		fov_changer = "Cambiar FOV",
		day_night_cycle = "Ciclo día/noche",
		custom_skybox = "Skybox personalizado",
		orbit_player = "Orbitar jugador",
		orbit_speed = "Velocidad de órbita",
		orbit_distance = "Distancia de órbita",
		select_player = "Seleccionar jugador",
		sect_orbit = "Órbita",
		experimental = "Experimental",
		blur_background = "Fondo borroso (Experimental)",
		blur_hint = "⚠ Experimental: Usa blur en vez de oscurecer",
		custom_themes = "Temas personalizados",
		save_theme = "Guardar tema",
		load_theme = "Cargar tema",
		delete_theme = "Eliminar tema",
		theme_name = "Nombre del tema...",
		select_theme = "Seleccionar tema",
		resize_hint = "Arrastre la esquina para redimensionar",
		fps_unlocker = "Desbloqueo de FPS",
		max_zoom = "Zoom máximo de cámara",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Poder de Fling",
		walk_fling = "Walk Fling",
		fly_fling = "Fly Fling",
		spin = "Spin",
		spin_speed = "Velocidad de Spin",
	},
}

local CurrentLang = "EN"
local function L(key)
	return Langs[CurrentLang][key] or Langs.EN[key] or key
end

-- ═══ SETTINGS ═══
local S = {
	Fly = false, FlySpeed = 50,
	Speed = false, WalkSpeed = 16,
	JumpBoost = false, JumpPower = 50,
	InfJump = false, Noclip = false,
	ESP = false, ESPColor = {255, 0, 0}, ESPOutline = {255, 255, 255},
	ESPFillTransparency = 0.5, ESPDistance = 1000,
	ESPShowName = true, ESPShowHealth = true, ESPTeamCheck = false,
	ESPTracers = false, ESPRainbow = false, ESPBoxes = false,
	Fullbright = false, NoFog = false, AntiLag = false, ClickTP = false, AntiAFK = true,
	Ragdoll = false,
	Language = "EN",
	AutoLoadConfig = "",
	ParticleStyle = "None",
	ShowKeybindPanel = false,
	BlurBackground = false,
	-- Screen Info
	FPSCounter = false,
	FPSColor = {255, 255, 255},
	Coordinates = false,
	CoordsColor = {255, 255, 255},
	-- Camera/Visual
	Chams = false,
	ChamsColor = {255, 0, 0},
	Crosshair = false,
	CrosshairColor = {255, 255, 255},
	CrosshairSize = 10,
	CrosshairThickness = 2,
	FOV = 70,
	DayNightTime = 14,
	CustomSkybox = "",
	MaxZoom = 128,
	-- Orbit
	OrbitPlayer = false,
	OrbitSpeed = 1,
	OrbitDistance = 15,
	OrbitTarget = "",
	-- Fling & Spin
	Fling = false,
	FlingPower = 500,
	WalkFling = false,
	FlyFling = false,
	Spin = false,
	SpinSpeed = 20,
	Theme = {
		Accent = {111, 90, 255},
		Bg = {16, 16, 22},
		Sidebar = {12, 12, 17},
		Card = {26, 26, 36},
		CardHover = {36, 36, 50},
		Text = {240, 240, 240},
		SubText = {130, 130, 155},
		ToggleOn = {111, 90, 255},
		ToggleOff = {50, 50, 65},
		Danger = {255, 65, 65},
	},
	Keybinds = {
		ToggleMenu = "RightControl",
	}
}

local function TC(t) return Color3.fromRGB(t[1], t[2], t[3]) end

-- ═══ CONFIG SYSTEM ═══
local ConfigDir = "NeoHub"
pcall(function() if not isfolder(ConfigDir) then makefolder(ConfigDir) end end)
pcall(function() if not isfolder(ConfigDir.."/Configs") then makefolder(ConfigDir.."/Configs") end end)
pcall(function() if not isfolder(ConfigDir.."/Themes") then makefolder(ConfigDir.."/Themes") end end)

local function SaveConfig(name)
	pcall(function() writefile(ConfigDir.."/Configs/"..name..".json", HttpService:JSONEncode(S)) end)
end
local function LoadConfig(name)
	pcall(function()
		if isfile(ConfigDir.."/Configs/"..name..".json") then
			local d = HttpService:JSONDecode(readfile(ConfigDir.."/Configs/"..name..".json"))
			for k,v in pairs(d) do S[k] = v end
			CurrentLang = S.Language or "EN"
		end
	end)
end
local function DeleteConfig(name)
	pcall(function() delfile(ConfigDir.."/Configs/"..name..".json") end)
end
local function GetConfigs()
	local r = {}
	pcall(function()
		for _,f in pairs(listfiles(ConfigDir.."/Configs")) do
			local n = f:match("([^/\\]+)%.json$")
			if n and n ~= "_reload_temp" then table.insert(r, n) end
		end
	end)
	return r
end
local function SetAutoLoad(name)
	pcall(function() writefile(ConfigDir.."/autoload.txt", name) end)
end
local function GetAutoLoad()
	local r = ""
	pcall(function() if isfile(ConfigDir.."/autoload.txt") then r = readfile(ConfigDir.."/autoload.txt") end end)
	return r
end
local function SaveLanguage(lang)
	pcall(function() writefile(ConfigDir.."/language.txt", lang) end)
end
local function LoadLanguage()
	local r = "EN"
	pcall(function() if isfile(ConfigDir.."/language.txt") then r = readfile(ConfigDir.."/language.txt") end end)
	return r
end

-- Theme system
local function SaveTheme(name)
	pcall(function() writefile(ConfigDir.."/Themes/"..name..".json", HttpService:JSONEncode(S.Theme)) end)
end
local function LoadTheme(name)
	pcall(function()
		if isfile(ConfigDir.."/Themes/"..name..".json") then
			local d = HttpService:JSONDecode(readfile(ConfigDir.."/Themes/"..name..".json"))
			for k,v in pairs(d) do S.Theme[k] = v end
		end
	end)
end
local function DeleteTheme(name)
	pcall(function() delfile(ConfigDir.."/Themes/"..name..".json") end)
end
local function GetThemes()
	local r = {}
	pcall(function()
		for _,f in pairs(listfiles(ConfigDir.."/Themes")) do
			local n = f:match("([^/\\]+)%.json$")
			if n then table.insert(r, n) end
		end
	end)
	return r
end

CurrentLang = LoadLanguage()
S.Language = CurrentLang

do
	local al = GetAutoLoad()
	if al ~= "" then LoadConfig(al) end
	local savedLang = LoadLanguage()
	if savedLang and Langs[savedLang] then
		CurrentLang = savedLang
		S.Language = savedLang
	end
end

-- ═══ DESTROY OLD ═══
pcall(function() CoreGui:FindFirstChild("NeoHub"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHLoader"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHKeybindPanel"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHToast"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHColorPicker"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHNotification"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHScreenInfo"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHCrosshair"):Destroy() end)

-- ═══ HELPERS ═══
local function tween(obj, props, t, style, dir)
	TweenService:Create(obj, TweenInfo.new(t or 0.3, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), props):Play()
end
local function Create(c, p)
	local o = Instance.new(c)
	for k,v in pairs(p) do if k ~= "Parent" then o[k] = v end end
	if p.Parent then o.Parent = p.Parent end
	return o
end
local function Corner(p, r) return Create("UICorner", {CornerRadius = UDim.new(0, r or 8), Parent = p}) end
local function Pad(p, t, b, l, r)
	if not b then b = t; l = t; r = t end
	return Create("UIPadding", {PaddingTop=UDim.new(0,t), PaddingBottom=UDim.new(0,b),
		PaddingLeft=UDim.new(0,l), PaddingRight=UDim.new(0,r), Parent=p})
end

-- ═══ KEYBIND SYSTEM ═══
local KeybindRegistry = {}
local ToggleRefs = {}

local function RegisterKeybind(name, callback, defaultKey)
	local existing = nil
	for i, kb in ipairs(KeybindRegistry) do
		if kb.name == name then existing = i; break end
	end
	local entry = {name = name, callback = callback, key = S.Keybinds[name] or defaultKey or "None", enabled = false}
	if existing then KeybindRegistry[existing] = entry else table.insert(KeybindRegistry, entry) end
	S.Keybinds[name] = entry.key
end

local function SetKeybindForName(name, key)
	S.Keybinds[name] = key
	for _, kb in ipairs(KeybindRegistry) do if kb.name == name then kb.key = key; break end end
end

local function SetKeybindState(name, state)
	for _, kb in ipairs(KeybindRegistry) do if kb.name == name then kb.enabled = state; break end end
end

local function FindKeybindByKey(key)
	if key == "None" then return nil end
	for _, kb in ipairs(KeybindRegistry) do
		if kb.key == key then return kb.name end
	end
	if S.Keybinds.ToggleMenu == key then return "ToggleMenu" end
	return nil
end

local keybindPopupOpen = false

-- ═══ PANIC FUNCTION ═══
local function PanicUnload()
	pcall(function()
		S.Fly = false; S.Speed = false; S.JumpBoost = false
		S.InfJump = false; S.Noclip = false; S.ESP = false
		S.Fullbright = false; S.NoFog = false; S.ClickTP = false
		S.AntiLag = false; S.Ragdoll = false; S.OrbitPlayer = false
		S.Chams = false; S.Crosshair = false; S.FPSCounter = false; S.Coordinates = false
		S.Fling = false; S.WalkFling = false; S.FlyFling = false; S.Spin = false
		local root = getRoot()
		pcall(function() root:FindFirstChild("NHFly"):Destroy() end)
		pcall(function() root:FindFirstChild("NHGyro"):Destroy() end)
		pcall(function() root:FindFirstChild("NHSpin"):Destroy() end)
		getHum().WalkSpeed = 16; getHum().JumpPower = 50
		Lighting.Brightness = 1; Lighting.GlobalShadows = true
		Lighting.Ambient = Color3.fromRGB(127, 127, 127)
		Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
		Lighting.FogEnd = 1000
		workspace.CurrentCamera.FieldOfView = 70
	end)
	pcall(function() CoreGui:FindFirstChild("NeoHub"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHLoader"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHKeybindPanel"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHToast"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHColorPicker"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHNotification"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHScreenInfo"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHCrosshair"):Destroy() end)
	pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)
end

local function CopyToClipboard(text)
	pcall(function()
		if setclipboard then setclipboard(text) elseif toclipboard then toclipboard(text) end
	end)
end

-- ═══ CUSTOM NOTIFICATION SYSTEM (ROUNDED & BEAUTIFUL) ═══
local NotificationGui
local NotificationContainer
local function SetupNotificationSystem()
	pcall(function() CoreGui:FindFirstChild("NHNotification"):Destroy() end)
	NotificationGui = Create("ScreenGui", {Name = "NHNotification", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	pcall(ProtectGui, NotificationGui); NotificationGui.Parent = CoreGui
	NotificationContainer = Create("Frame", {
		Size = UDim2.new(0, 340, 1, -20),
		Position = UDim2.new(1, -350, 0, 10),
		BackgroundTransparency = 1,
		Parent = NotificationGui
	})
	Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10), VerticalAlignment = Enum.VerticalAlignment.Top, Parent = NotificationContainer})
end
SetupNotificationSystem()

local function Notify(title, text, duration)
	if not NotificationContainer then SetupNotificationSystem() end
	
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Bg),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 16)
	
	local gradient = Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 220))
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.95),
			NumberSequenceKeypoint.new(1, 0.98)
		}),
		Rotation = 45,
		Parent = notif
	})
	
	local stroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = notif})
	Corner(notif, 16)
	
	local inner = Create("Frame", {
		Size = UDim2.new(1, -16, 1, -16),
		Position = UDim2.new(0, 8, 0, 8),
		BackgroundTransparency = 1,
		Parent = notif
	})
	
	local accentCircle = Create("Frame", {
		Size = UDim2.new(0, 44, 0, 44),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = TC(S.Theme.Accent),
		BackgroundTransparency = 0.1,
		BorderSizePixel = 0,
		Parent = inner
	})
	Corner(accentCircle, 22)
	
	local icon = Create("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = "✨",
		TextSize = 20,
		Font = Enum.Font.GothamBold,
		TextColor3 = Color3.new(1, 1, 1),
		Parent = accentCircle
	})
	
	local titleLbl = Create("TextLabel", {
		Size = UDim2.new(1, -60, 0, 22),
		Position = UDim2.new(0, 54, 0, 6),
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = TC(S.Theme.Text),
		Font = Enum.Font.GothamBlack,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Parent = inner
	})
	
	local textLbl = Create("TextLabel", {
		Size = UDim2.new(1, -60, 0, 36),
		Position = UDim2.new(0, 54, 0, 28),
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = TC(S.Theme.SubText),
		Font = Enum.Font.GothamSemibold,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Parent = inner
	})
	
	local progressBg = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 4),
		Position = UDim2.new(0, 0, 1, -12),
		BackgroundColor3 = TC(S.Theme.ToggleOff),
		BorderSizePixel = 0,
		Parent = inner
	})
	Corner(progressBg, 2)
	
	local progressFill = Create("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = TC(S.Theme.Accent),
		BorderSizePixel = 0,
		Parent = progressBg
	})
	Corner(progressFill, 2)
	
	local glow = Create("ImageLabel", {
		Size = UDim2.new(1, 40, 1, 40),
		Position = UDim2.new(0, -20, 0, -20),
		BackgroundTransparency = 1,
		Image = "rbxassetid://5028857084",
		ImageColor3 = TC(S.Theme.Accent),
		ImageTransparency = 0.85,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(24, 24, 276, 276),
		Parent = notif
	})
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 90)}, 0.4, Enum.EasingStyle.Back)
	tween(progressFill, {Size = UDim2.new(0, 0, 1, 0)}, duration or 4, Enum.EasingStyle.Linear)
	
	task.spawn(function()
		while notif.Parent do
			tween(accentCircle, {BackgroundTransparency = 0.3}, 0.5)
			task.wait(0.5)
			tween(accentCircle, {BackgroundTransparency = 0.1}, 0.5)
			task.wait(0.5)
		end
	end)
	
	task.delay(duration or 4, function()
		tween(stroke, {Transparency = 1}, 0.3)
		tween(notif, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.45, function() pcall(function() notif:Destroy() end) end)
	end)
end

-- ═══ CUSTOM TOAST ═══
local ToastGui
local function ShowToast(text, duration)
	pcall(function() if ToastGui then ToastGui:Destroy() end end)
	ToastGui = Create("ScreenGui", {Name = "NHToast", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	pcall(ProtectGui, ToastGui); ToastGui.Parent = CoreGui
	local toast = Create("Frame", {
		Size = UDim2.new(0, 340, 0, 56), Position = UDim2.new(1, 10, 0.5, -28),
		BackgroundColor3 = TC(S.Theme.Bg), BorderSizePixel = 0, Parent = ToastGui
	}); Corner(toast, 16)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = toast})
	
	local accentBar = Create("Frame", {Size = UDim2.new(0, 5, 0.7, 0), Position = UDim2.new(0, 10, 0.15, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = toast}); Corner(accentBar, 3)
	Create("TextLabel", {Size = UDim2.new(1, -32, 1, 0), Position = UDim2.new(0, 24, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, Parent = toast})
	
	tween(toast, {Position = UDim2.new(1, -350, 0.5, -28)}, 0.5, Enum.EasingStyle.Back)
	task.delay(duration or 4, function()
		tween(toast, {Position = UDim2.new(1, 10, 0.5, -28)}, 0.4)
		task.delay(0.5, function() pcall(function() ToastGui:Destroy() end) end)
	end)
end

-- ═══ BLUR BACKGROUND SYSTEM ═══
local BlurEffect = nil
local function CreateBlur()
	if S.BlurBackground then
		pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)
		BlurEffect = Instance.new("BlurEffect")
		BlurEffect.Name = "NHBlur"
		BlurEffect.Size = 0
		BlurEffect.Parent = Lighting
	end
end

local function ShowBlur()
	if S.BlurBackground and BlurEffect then
		tween(BlurEffect, {Size = 24}, 0.3)
	end
end

local function HideBlur()
	if BlurEffect then
		tween(BlurEffect, {Size = 0}, 0.3)
	end
end

CreateBlur()

-- ═══════════════════════════════════════════
-- LOADING SCREEN
-- ═══════════════════════════════════════════
local LoaderGui = Create("ScreenGui", {Name = "NHLoader", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, LoaderGui)
LoaderGui.Parent = CoreGui

local LoaderWindow = Create("Frame", {
	Size = UDim2.new(0, 420, 0, 280), Position = UDim2.new(0.5, -210, 0.5, -140),
	BackgroundColor3 = TC(S.Theme.Bg), BorderSizePixel = 0, ClipsDescendants = true, Parent = LoaderGui
})
Corner(LoaderWindow, 18)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = LoaderWindow})

for i = 1, 15 do
	local pdot = Create("Frame", {
		Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4)),
		Position = UDim2.new(math.random(5, 95) / 100, 0, math.random(5, 95) / 100, 0),
		BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = math.random(60, 90) / 100,
		BorderSizePixel = 0, Parent = LoaderWindow
	})
	Corner(pdot, 10)
	local pSX, pSY = pdot.Position.X.Scale, pdot.Position.Y.Scale
	task.spawn(function()
		while pdot.Parent do
			tween(pdot, {Position = UDim2.new(math.clamp(pSX + (math.random()-0.5)*0.1,0.02,0.98), 0, math.clamp(pSY + (math.random()-0.5)*0.1,0.02,0.98), 0), BackgroundTransparency = math.random(40,80)/100}, math.random(15,30)/10)
			task.wait(math.random(15, 30) / 10)
		end
	end)
end

local LoadCenter = Create("Frame", {Size = UDim2.new(1, -40, 1, -30), Position = UDim2.new(0, 20, 0, 15), BackgroundTransparency = 1, Parent = LoaderWindow})

local LogoRing = Create("Frame", {Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0.5, -35, 0, 10), BackgroundTransparency = 1, Parent = LoadCenter})
local RingOuter = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, Parent = LogoRing})
Corner(RingOuter, 35)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 3, Parent = RingOuter})
local RingInner = Create("Frame", {Size = UDim2.new(0, 46, 0, 46), Position = UDim2.new(0.5, -23, 0.5, -23), BackgroundColor3 = TC(S.Theme.Bg), Parent = LogoRing})
Corner(RingInner, 23)
Create("TextLabel", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "N", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBlack, TextSize = 26, Parent = RingInner})

task.spawn(function()
	local rot = 0
	while LogoRing.Parent do rot = rot + 2; RingOuter.Rotation = rot; task.wait(0.016) end
end)

local LoadTitle = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, 0, 90), BackgroundTransparency = 1, Text = "Neo's Hub", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBlack, TextSize = 26, TextTransparency = 1, Parent = LoadCenter})
local LoadVersion = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 118), BackgroundTransparency = 1, Text = L("version"), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 12, TextTransparency = 1, Parent = LoadCenter})

local ProgressBG = Create("Frame", {Size = UDim2.new(0.75, 0, 0, 5), Position = UDim2.new(0.125, 0, 0, 160), BackgroundColor3 = Color3.fromRGB(30, 30, 40), BorderSizePixel = 0, Parent = LoadCenter})
Corner(ProgressBG, 3)
local ProgressFill = Create("Frame", {Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = ProgressBG})
Corner(ProgressFill, 3)

local LoadStatus = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 0, 174), BackgroundTransparency = 1, Text = "", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextTransparency = 1, Parent = LoadCenter})
local WelcomeText = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 22), Position = UDim2.new(0, 0, 0, 205), BackgroundTransparency = 1, Text = "", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 14, TextTransparency = 1, Parent = LoadCenter})

task.spawn(function()
	task.wait(0.3); tween(LoadTitle, {TextTransparency = 0}, 0.6)
	task.wait(0.3); tween(LoadVersion, {TextTransparency = 0}, 0.4); tween(LoadStatus, {TextTransparency = 0}, 0.4)
	task.wait(0.2)
	for _, step in ipairs({{0.2,"loading_init"},{0.5,"loading_gui"},{0.8,"loading_hooks"},{1.0,"loading_done"}}) do
		LoadStatus.Text = L(step[2]); tween(ProgressFill, {Size = UDim2.new(step[1], 0, 1, 0)}, 0.6); task.wait(0.7)
	end
	task.wait(0.3); WelcomeText.Text = string.format(L("loading_welcome"), Player.DisplayName); tween(WelcomeText, {TextTransparency = 0}, 0.5); task.wait(1.2)
	tween(LoaderWindow, {BackgroundTransparency = 1}, 0.6)
	for _, desc in pairs(LoaderWindow:GetDescendants()) do
		pcall(function() if desc:IsA("TextLabel") or desc:IsA("Frame") then tween(desc, {BackgroundTransparency = 1, TextTransparency = 1}, 0.5) end; if desc:IsA("UIStroke") then tween(desc, {Transparency = 1}, 0.5) end end)
	end
	task.wait(0.9); LoaderGui:Destroy()
end)

task.wait(4.5)
-- ═══════════════════════════════════════════
-- MAIN GUI
-- ═══════════════════════════════════════════
local Gui = Create("ScreenGui", {Name = "NeoHub", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, Gui)
Gui.Parent = CoreGui

pcall(function()
	if not isfile(ConfigDir.."/reload_source.txt") then
		if _G.NesficateHubSource then writefile(ConfigDir.."/reload_source.txt", _G.NesficateHubSource) end
	end
end)

local Main = Create("Frame", {
	Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0),
	BackgroundColor3 = TC(S.Theme.Bg), ClipsDescendants = true, Parent = Gui
})
Corner(Main, 16)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1.5, Transparency = 0.5, Parent = Main})

local defaultWidth, defaultHeight = 740, 480
local minWidth, minHeight = 500, 350
local maxWidth, maxHeight = 1000, 700
local currentWidth, currentHeight = defaultWidth, defaultHeight

local fullSize = UDim2.new(0, defaultWidth, 0, defaultHeight)
tween(Main, {Size = fullSize, Position = UDim2.new(0.5, -defaultWidth/2, 0.5, -defaultHeight/2)}, 0.7, Enum.EasingStyle.Back)

-- Minimized title bar
local MinimizedBar = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, Visible = false, ZIndex = 10, Parent = Main})
Create("TextLabel", {Size = UDim2.new(1, -90, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = "Neo's Hub", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 10, Parent = MinimizedBar})
local MinBarExpand = Create("TextButton", {Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -40, 0.5, -15), BackgroundColor3 = TC(S.Theme.Card), Text = "+", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 18, BorderSizePixel = 0, ZIndex = 10, Parent = MinimizedBar})
Corner(MinBarExpand, 8)

local minimized = false

-- ═══ RESIZE HANDLE (Improved corner design) ═══
local ResizeHandle = Create("Frame", {
	Size = UDim2.new(0, 18, 0, 18),
	Position = UDim2.new(1, -22, 1, -22),
	BackgroundTransparency = 1,
	ZIndex = 50,
	Parent = Main
})

-- Create diagonal lines for resize indicator
for i = 1, 3 do
	local line = Create("Frame", {
		Size = UDim2.new(0, 2, 0, 6 + (i-1)*4),
		Position = UDim2.new(0, 4 + (i-1)*5, 1, -8 - (i-1)*4),
		Rotation = 45,
		BackgroundColor3 = TC(S.Theme.Accent),
		BackgroundTransparency = 0.3,
		BorderSizePixel = 0,
		ZIndex = 51,
		Parent = ResizeHandle
	})
	Corner(line, 1)
end

local resizeBtn = Create("TextButton", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "",
	ZIndex = 52,
	Parent = ResizeHandle
})

-- Resize functionality
local isResizing = false
local resizeStartPos, resizeStartSize

resizeBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isResizing = true
		resizeStartPos = input.Position
		resizeStartSize = Main.Size
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then
				tween(line, {BackgroundTransparency = 0}, 0.1)
			end
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isResizing = false
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then
				tween(line, {BackgroundTransparency = 0.3}, 0.1)
			end
		end
	end
end)

UIS.InputChanged:Connect(function(input)
	if isResizing and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - resizeStartPos
		local newWidth = math.clamp(resizeStartSize.X.Offset + delta.X, minWidth, maxWidth)
		local newHeight = math.clamp(resizeStartSize.Y.Offset + delta.Y, minHeight, maxHeight)
		currentWidth, currentHeight = newWidth, newHeight
		Main.Size = UDim2.new(0, newWidth, 0, newHeight)
	end
end)

resizeBtn.MouseEnter:Connect(function()
	for _, line in pairs(ResizeHandle:GetChildren()) do
		if line:IsA("Frame") then
			tween(line, {BackgroundTransparency = 0.1}, 0.15)
		end
	end
end)
resizeBtn.MouseLeave:Connect(function()
	if not isResizing then
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then
				tween(line, {BackgroundTransparency = 0.3}, 0.15)
			end
		end
	end
end)

-- Drag (only from title area)
do
	local dragging, dragStart, startPos
	local DRAG_HEIGHT = 50

	Main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local relY = input.Position.Y - Main.AbsolutePosition.Y
			local relX = input.Position.X - Main.AbsolutePosition.X
			if relX > Main.AbsoluteSize.X - 30 and relY > Main.AbsoluteSize.Y - 30 then return end
			if minimized or relY <= DRAG_HEIGHT then
				dragging = true; dragStart = input.Position; startPos = Main.Position
				input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
			end
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- ═══ BACKGROUND PARTICLES ═══
local particleContainer = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 0, Parent = Main})
local activeParticles = {}
local particleRunning = false
local ParticleChars = {None = {}, Snow = {"*", "+", ".", "o", "'"}, Stars = {"*", "+", ".", "x", "'"}, Hearts = {"<3", "o", "*", "+", "."}, Bubbles = {"o", "O", ".", "0", "o"}, Rain = {"|", "!", "l", "|", "!"}}
local function ClearParticles() particleRunning = false; for _, pp in pairs(activeParticles) do pcall(function() pp:Destroy() end) end; activeParticles = {} end
local function SpawnParticles(style)
	ClearParticles(); if style == "None" or not ParticleChars[style] then return end
	particleRunning = true; local chars = ParticleChars[style]
	task.spawn(function()
		while particleRunning and Main.Parent do
			if #activeParticles > 40 then local old = table.remove(activeParticles, 1); pcall(function() old:Destroy() end) end
			local ch = chars[math.random(1, #chars)]; local startX = math.random(5, 95) / 100
			local lbl = Create("TextLabel", {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(startX, 0, -0.05, 0), BackgroundTransparency = 1, Text = ch, TextColor3 = TC(S.Theme.Accent), TextTransparency = math.random(30, 70) / 100, Font = Enum.Font.GothamBold, TextSize = math.random(8, 16), ZIndex = 0, Rotation = style == "Rain" and 0 or math.random(-30, 30), Parent = particleContainer})
			table.insert(activeParticles, lbl)
			local dur = style == "Rain" and math.random(8, 15) / 10 or math.random(30, 60) / 10
			local endX = style == "Rain" and startX or (startX + (math.random() - 0.5) * 0.15)
			tween(lbl, {Position = UDim2.new(endX, 0, 1.05, 0), TextTransparency = 1, Rotation = lbl.Rotation + math.random(-45, 45)}, dur)
			task.delay(dur + 0.1, function() pcall(function() lbl:Destroy() end) end)
			task.wait(style == "Rain" and 0.05 or math.random(3, 8) / 10)
		end
	end)
end
if S.ParticleStyle and S.ParticleStyle ~= "None" then task.delay(1, function() SpawnParticles(S.ParticleStyle) end) end

-- ═══ SIDEBAR ═══
local Sidebar = Create("Frame", {Size = UDim2.new(0, 180, 1, 0), BackgroundColor3 = TC(S.Theme.Sidebar), BorderSizePixel = 0, Parent = Main})
Corner(Sidebar, 16)
Create("Frame", {Size = UDim2.new(0, 16, 1, 0), Position = UDim2.new(1, -16, 0, 0), BackgroundColor3 = TC(S.Theme.Sidebar), BorderSizePixel = 0, Parent = Sidebar})

local ProfFrame = Create("Frame", {Size = UDim2.new(1, 0, 0, 95), BackgroundTransparency = 1, Parent = Sidebar})
local AvFrame = Create("Frame", {Size = UDim2.new(0, 52, 0, 52), Position = UDim2.new(0, 14, 0, 14), BackgroundColor3 = TC(S.Theme.Card), Parent = ProfFrame})
Corner(AvFrame, 26)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = AvFrame})
local AvImg = Create("ImageLabel", {Size = UDim2.new(1, -4, 1, -4), Position = UDim2.new(0, 2, 0, 2), BackgroundTransparency = 1, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), Parent = AvFrame})
Corner(AvImg, 24)
Create("TextLabel", {Size = UDim2.new(1, -78, 0, 20), Position = UDim2.new(0, 74, 0, 14), BackgroundTransparency = 1, Text = Player.DisplayName, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Parent = ProfFrame})
Create("TextLabel", {Size = UDim2.new(1, -78, 0, 16), Position = UDim2.new(0, 74, 0, 34), BackgroundTransparency = 1, Text = "@" .. Player.Name, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Parent = ProfFrame})

local activeLabel = Create("TextLabel", {Size = UDim2.new(0, 60, 0, 16), Position = UDim2.new(0, 74, 0, 52), BackgroundTransparency = 1, Text = "✨ Active", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = ProfFrame})
task.spawn(function() while activeLabel.Parent do local hue = (tick() * 0.3) % 1; tween(activeLabel, {TextColor3 = Color3.fromHSV(hue, 0.6, 1)}, 0.5); task.wait(0.5) end end)

Create("Frame", {Size = UDim2.new(1, -28, 0, 1), Position = UDim2.new(0, 14, 0, 88), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = ProfFrame})

local TabFrame = Create("Frame", {Size = UDim2.new(1, 0, 1, -105), Position = UDim2.new(0, 0, 0, 100), BackgroundTransparency = 1, Parent = Sidebar})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 3), Parent = TabFrame})
Pad(TabFrame, 6, 6, 6, 6)

local tabData = {
	{key = "tab_movement", icon = "🚀 ", order = 1}, 
	{key = "tab_visual", icon = "👁 ", order = 2},
	{key = "tab_misc", icon = "⚡ ", order = 3}, 
	{key = "tab_settings", icon = "⚙️ ", order = 4},
	{key = "tab_themes", icon = "🎨 ", order = 5},
	{key = "tab_credits", icon = "❤️ ", order = 6},
}

local tabButtons, tabPages, activeTab = {}, {}, nil

local ContentArea = Create("Frame", {Size = UDim2.new(1, -188, 1, -12), Position = UDim2.new(0, 184, 0, 6), BackgroundTransparency = 1, ClipsDescendants = true, Parent = Main})

local TitleBar = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundTransparency = 1, Parent = ContentArea})
local PageTitleLabel = Create("TextLabel", {Size = UDim2.new(1, -100, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBlack, TextSize = 22, TextXAlignment = Enum.TextXAlignment.Left, Parent = TitleBar})
Create("TextLabel", {Size = UDim2.new(0, 140, 0, 14), Position = UDim2.new(0, 8, 1, -16), BackgroundTransparency = 1, Text = "Neo's Hub v3.0", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = TitleBar})

local guiVis = true

local CloseBtn = Create("TextButton", {Size = UDim2.new(0, 34, 0, 34), Position = UDim2.new(1, -42, 0, 5), BackgroundColor3 = TC(S.Theme.Card), Text = "X", TextColor3 = TC(S.Theme.Danger), Font = Enum.Font.GothamBold, TextSize = 18, BorderSizePixel = 0, Parent = TitleBar})
Corner(CloseBtn, 10)
CloseBtn.MouseButton1Click:Connect(function()
	guiVis = false
	tween(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
	task.delay(0.35, function() Main.Visible = false end)
	ShowToast(string.format(L("hidden_hint"), S.Keybinds.ToggleMenu or "RightControl"), 5)
end)
CloseBtn.MouseEnter:Connect(function() tween(CloseBtn, {BackgroundColor3 = TC(S.Theme.Danger), TextColor3 = Color3.new(1,1,1)}, 0.15) end)
CloseBtn.MouseLeave:Connect(function() tween(CloseBtn, {BackgroundColor3 = TC(S.Theme.Card), TextColor3 = TC(S.Theme.Danger)}, 0.15) end)

local MinBtn = Create("TextButton", {Size = UDim2.new(0, 34, 0, 34), Position = UDim2.new(1, -82, 0, 5), BackgroundColor3 = TC(S.Theme.Card), Text = "—", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 16, BorderSizePixel = 0, Parent = TitleBar})
Corner(MinBtn, 10)

local minSize = UDim2.new(0, 300, 0, 40)

local function ToggleMinimize()
	minimized = not minimized
	if minimized then
		tween(Main, {Size = minSize}, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.1, function() ContentArea.Visible = false; Sidebar.Visible = false; MinimizedBar.Visible = true; ResizeHandle.Visible = false end)
	else
		MinimizedBar.Visible = false; ContentArea.Visible = true; Sidebar.Visible = true; ResizeHandle.Visible = true
		tween(Main, {Size = UDim2.new(0, currentWidth, 0, currentHeight)}, 0.4, Enum.EasingStyle.Back)
	end
end

MinBtn.MouseButton1Click:Connect(ToggleMinimize)
MinBtn.MouseEnter:Connect(function() tween(MinBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15) end)
MinBtn.MouseLeave:Connect(function() tween(MinBtn, {BackgroundColor3 = TC(S.Theme.Card)}, 0.15) end)
MinBarExpand.MouseButton1Click:Connect(ToggleMinimize)

-- ═══ PAGE BUILDER ═══
local function MakePage(key)
	local page = Create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, -52), Position = UDim2.new(0, 0, 0, 50),
		BackgroundTransparency = 1, ScrollBarThickness = 4, ScrollBarImageColor3 = TC(S.Theme.Accent),
		BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y,
		Visible = false, Parent = ContentArea
	})
	Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 7), Parent = page})
	Pad(page, 4, 4, 4, 4)
	tabPages[key] = page
	return page
end

local function SwitchTab(key)
	if activeTab == key then return end
	if activeTab and tabPages[activeTab] then
		local old = tabPages[activeTab]
		for _, ch in pairs(old:GetChildren()) do
			if ch:IsA("GuiObject") then tween(ch, {BackgroundTransparency = 1}, 0.15)
				pcall(function() for _, sub in pairs(ch:GetDescendants()) do if sub:IsA("TextLabel") or sub:IsA("TextButton") or sub:IsA("TextBox") then tween(sub, {TextTransparency = 1}, 0.15) end end end)
			end
		end
		task.delay(0.16, function() old.Visible = false end)
	end
	activeTab = key
	for k, btn in pairs(tabButtons) do
		local ind = btn:FindFirstChild("Indicator")
		if k == key then
			tween(btn, {BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0}, 0.3)
			btn:FindFirstChildOfClass("TextLabel").TextColor3 = Color3.new(1, 1, 1)
			if ind then tween(ind, {BackgroundTransparency = 0}, 0.25) end
		else
			tween(btn, {BackgroundTransparency = 1}, 0.3)
			btn:FindFirstChildOfClass("TextLabel").TextColor3 = TC(S.Theme.SubText)
			if ind then tween(ind, {BackgroundTransparency = 1}, 0.25) end
		end
	end
	PageTitleLabel.Text = L(key)
	task.delay(0.17, function()
		local pg = tabPages[key]; if not pg then return end; pg.Visible = true; pg.CanvasPosition = Vector2.zero
		for _, ch in pairs(pg:GetChildren()) do if ch:IsA("GuiObject") then ch.BackgroundTransparency = 1; pcall(function() for _, sub in pairs(ch:GetDescendants()) do if sub:IsA("TextLabel") or sub:IsA("TextButton") or sub:IsA("TextBox") then sub.TextTransparency = 1 end end end) end end
		local d2 = 0
		for _, ch in pairs(pg:GetChildren()) do if ch:IsA("GuiObject") then task.delay(d2, function() tween(ch, {BackgroundTransparency = ch:GetAttribute("OrigBT") or 0}, 0.25); pcall(function() for _, sub in pairs(ch:GetDescendants()) do if sub:IsA("TextLabel") or sub:IsA("TextButton") or sub:IsA("TextBox") then tween(sub, {TextTransparency = sub:GetAttribute("OrigTT") or 0}, 0.25) end end end) end); d2 = d2 + 0.035 end end
	end)
end

for _, td in ipairs(tabData) do
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 1, Text = "", BorderSizePixel = 0, LayoutOrder = td.order, Parent = TabFrame})
	Corner(btn, 10)
	Create("Frame", {Name = "Indicator", Size = UDim2.new(0, 3, 0.6, 0), Position = UDim2.new(0, 0, 0.2, 0), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = btn}); Corner(btn:FindFirstChild("Indicator"), 2)
	Create("TextLabel", {Size = UDim2.new(1, -18, 1, 0), Position = UDim2.new(0, 18, 0, 0), BackgroundTransparency = 1, Text = td.icon .. L(td.key), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = btn})
	btn.MouseEnter:Connect(function() if activeTab ~= td.key then tween(btn, {BackgroundTransparency = 0.85, BackgroundColor3 = TC(S.Theme.Accent)}, 0.15) end end)
	btn.MouseLeave:Connect(function() if activeTab ~= td.key then tween(btn, {BackgroundTransparency = 1}, 0.15) end end)
	btn.MouseButton1Click:Connect(function() SwitchTab(td.key) end)
	tabButtons[td.key] = btn; MakePage(td.key)
end

-- ═══ UI COMPONENTS ═══

-- Keybind popup
local function ShowKeybindPopup(name, callback)
	if keybindPopupOpen then return end; keybindPopupOpen = true
	ShowBlur()
	
	local popup = Create("Frame", {Size = UDim2.new(0, 300, 0, 140), Position = UDim2.new(0.5, -150, 0.5, -70), BackgroundColor3 = TC(S.Theme.Bg), BorderSizePixel = 0, ZIndex = 101, Parent = Gui})
	Corner(popup, 16); Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Parent = popup})
	
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, 0, 12), BackgroundTransparency = 1, Text = L("set_keybind") .. ": " .. name, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, ZIndex = 102, Parent = popup})
	local statusLbl = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 45), BackgroundTransparency = 1, Text = L("press_key"), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 17, ZIndex = 102, Parent = popup})
	local warningLbl = Create("TextLabel", {Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 10, 0, 68), BackgroundTransparency = 1, Text = "", TextColor3 = TC(S.Theme.Danger), Font = Enum.Font.GothamSemibold, TextSize = 11, ZIndex = 102, TextWrapped = true, Parent = popup})
	
	local pcancel = Create("TextButton", {Size = UDim2.new(0, 80, 0, 30), Position = UDim2.new(0.5, -40, 1, -40), BackgroundColor3 = TC(S.Theme.Card), Text = "Cancel", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, ZIndex = 102, Parent = popup}); Corner(pcancel, 10)
	
	local conn
	local function cleanup() 
		keybindPopupOpen = false
		HideBlur()
		pcall(function() if conn then conn:Disconnect() end end)
		pcall(function() popup:Destroy() end)
	end
	
	pcancel.MouseButton1Click:Connect(cleanup)
	
	conn = UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keyName = input.KeyCode.Name
			if keyName == "Escape" then 
				SetKeybindForName(name, "None")
				cleanup()
				if callback then callback("None") end
				return 
			end
			
			local existingUser = FindKeybindByKey(keyName)
			if existingUser and existingUser ~= name then
				warningLbl.Text = string.format(L("keybind_already_used"), keyName, existingUser)
				tween(warningLbl, {TextColor3 = TC(S.Theme.Danger)}, 0.1)
				task.delay(0.1, function() tween(warningLbl, {TextColor3 = Color3.fromRGB(255, 100, 100)}, 0.1) end)
				return
			end
			
			SetKeybindForName(name, keyName)
			cleanup()
			if callback then callback(keyName) end
		end
	end)
	
	do
		local dr, ds, sp
		popup.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 then
				local ry = i.Position.Y - popup.AbsolutePosition.Y
				if ry <= 40 then
					dr = true; ds = i.Position; sp = popup.Position
					i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end)
				end
			end
		end)
		UIS.InputChanged:Connect(function(i)
			if dr and i.UserInputType == Enum.UserInputType.MouseMovement then
				local d = i.Position - ds
				popup.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
			end
		end)
	end
end

local function Section(parent, text)
	local s = Create("Frame", {Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1, Parent = parent}); s:SetAttribute("OrigBT", 1)
	Create("TextLabel", {Size = UDim2.new(1, -6, 1, 0), Position = UDim2.new(0, 6, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = s}):SetAttribute("OrigTT", 0)
	Create("Frame", {Size = UDim2.new(1, -6, 0, 1), Position = UDim2.new(0, 6, 1, -2), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, BorderSizePixel = 0, Parent = s}):SetAttribute("OrigBT", 0.8)
end

local function Toggle(parent, text, default, callback, keybindName)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 12)
	Create("TextLabel", {Size = UDim2.new(1, -80, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local tbg = Create("Frame", {Size = UDim2.new(0, 48, 0, 26), Position = UDim2.new(1, -62, 0.5, -13), BackgroundColor3 = default and TC(S.Theme.ToggleOn) or TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); tbg:SetAttribute("OrigBT", 0); Corner(tbg, 13)
	local circ = Create("Frame", {Size = UDim2.new(0, 20, 0, 20), Position = default and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = tbg}); circ:SetAttribute("OrigBT", 0); Corner(circ, 10)
	local glow = Create("Frame", {Size = UDim2.new(0, 48, 0, 26), Position = UDim2.new(1, -62, 0.5, -13), BackgroundColor3 = TC(S.Theme.ToggleOn), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 0, Parent = container}); glow:SetAttribute("OrigBT", 1); Corner(glow, 13)
	local enabled = default
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = container})
	local kbName = keybindName or text:gsub("[^%w]", "")
	local function upd()
		tween(tbg, {BackgroundColor3 = enabled and TC(S.Theme.ToggleOn) or TC(S.Theme.ToggleOff)}, 0.3)
		tween(circ, {Position = enabled and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)}, 0.3, Enum.EasingStyle.Back)
		tween(glow, {BackgroundTransparency = enabled and 0.85 or 1}, 0.35)
		SetKeybindState(kbName, enabled); UpdateKeybindPanel()
	end
	btn.MouseButton1Click:Connect(function() enabled = not enabled; upd(); callback(enabled) end)
	btn.MouseButton2Click:Connect(function() ShowKeybindPopup(kbName, function(key) RegisterKeybind(kbName, function() enabled = not enabled; upd(); callback(enabled) end, key); UpdateKeybindPanel(); Notify(L("hub_name"), kbName .. " -> " .. key, 2) end) end)
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.15) end)
	if S.Keybinds[kbName] and S.Keybinds[kbName] ~= "None" then RegisterKeybind(kbName, function() enabled = not enabled; upd(); callback(enabled) end, S.Keybinds[kbName]) end
	local ref = {Set = function(v) enabled = v; upd() end, Get = function() return enabled end}
	ToggleRefs[kbName] = ref; return ref
end

local function Slider(parent, text, min, max, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 60), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 12)
	local vlbl = Create("TextLabel", {Size = UDim2.new(1, -60, 0, 24), Position = UDim2.new(0, 16, 0, 4), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}); vlbl:SetAttribute("OrigTT", 0)
	
	-- Editable value badge
	local badge = Create("TextBox", {Size = UDim2.new(0, 50, 0, 22), Position = UDim2.new(1, -60, 0, 5), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, Text = tostring(default), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, ClearTextOnFocus = true, Parent = container}); badge:SetAttribute("OrigBT", 0.8); badge:SetAttribute("OrigTT", 0); Corner(badge, 8)
	
	local bar = Create("Frame", {Size = UDim2.new(1, -32, 0, 10), Position = UDim2.new(0, 16, 0, 38), BackgroundColor3 = TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); bar:SetAttribute("OrigBT", 0); Corner(bar, 5)
	local fill = Create("Frame", {Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = bar}); fill:SetAttribute("OrigBT", 0); Corner(fill, 5)
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200,200,255))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4)}), Parent = fill})
	local sliderDragging = false
	local currentVal = default
	
	local function update(pct)
		pct = math.clamp(pct, 0, 1)
		currentVal = math.floor(min + (max - min) * pct)
		fill.Size = UDim2.new(pct, 0, 1, 0)
		badge.Text = tostring(currentVal); callback(currentVal)
	end
	
	-- Click/drag on bar
	bar.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			sliderDragging = true
			local pct = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
			update(pct)
		end
	end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then sliderDragging = false end end)
	UIS.InputChanged:Connect(function(i)
		if sliderDragging and i.UserInputType == Enum.UserInputType.MouseMovement then
			local pct = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
			update(pct)
		end
	end)
	
	-- Manual input in badge
	badge.FocusLost:Connect(function(enterPressed)
		local num = tonumber(badge.Text)
		if num then
			num = math.clamp(math.floor(num), min, max)
			local pct = (num - min) / (max - min)
			update(pct)
		else
			badge.Text = tostring(currentVal)
		end
	end)
	
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.15) end)
end

local function SliderCompact(parent, text, min, max, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 12)
	Create("TextLabel", {Size = UDim2.new(0.42, 0, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	
	-- Editable value badge
	local badge = Create("TextBox", {Size = UDim2.new(0, 44, 0, 22), Position = UDim2.new(1, -54, 0.5, -11), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, Text = tostring(default), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, ClearTextOnFocus = true, Parent = container}); badge:SetAttribute("OrigBT", 0.8); badge:SetAttribute("OrigTT", 0); Corner(badge, 8)
	
	local bar = Create("Frame", {Size = UDim2.new(0.32, 0, 0, 8), Position = UDim2.new(0.44, 0, 0.5, -4), BackgroundColor3 = TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); bar:SetAttribute("OrigBT", 0); Corner(bar, 4)
	local fill = Create("Frame", {Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = bar}); fill:SetAttribute("OrigBT", 0); Corner(fill, 4)
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200,200,255))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4)}), Parent = fill})
	local sliderDragging = false
	local currentVal = default
	
	local function update(pct) 
		pct = math.clamp(pct, 0, 1)
		fill.Size = UDim2.new(pct, 0, 1, 0)
		currentVal = math.floor(min + (max - min) * pct)
		badge.Text = tostring(currentVal)
		callback(currentVal) 
	end
	
	bar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then sliderDragging = true; update(math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)) end end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then sliderDragging = false end end)
	UIS.InputChanged:Connect(function(i) if sliderDragging and i.UserInputType == Enum.UserInputType.MouseMovement then update(math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)) end end)
	
	-- Manual input in badge
	badge.FocusLost:Connect(function(enterPressed)
		local num = tonumber(badge.Text)
		if num then
			num = math.clamp(math.floor(num), min, max)
			local pct = (num - min) / (max - min)
			update(pct)
		else
			badge.Text = tostring(currentVal)
		end
	end)
	
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.15) end)
end

local function Button(parent, text, callback, danger, keybindName)
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = danger and Color3.fromRGB(45, 22, 22) or TC(S.Theme.Card), Text = "", BorderSizePixel = 0, Parent = parent}); btn:SetAttribute("OrigBT", 0); Corner(btn, 12)
	Create("TextLabel", {Size = UDim2.new(1, -40, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = danger and TC(S.Theme.Danger) or TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = btn}):SetAttribute("OrigTT", 0)
	local arrow = Create("TextLabel", {Size = UDim2.new(0, 20, 1, 0), Position = UDim2.new(1, -30, 0, 0), BackgroundTransparency = 1, Text = ">", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 18, Parent = btn}); arrow:SetAttribute("OrigTT", 0)
	btn.MouseEnter:Connect(function() tween(btn, {BackgroundColor3 = danger and Color3.fromRGB(65, 28, 28) or TC(S.Theme.CardHover)}, 0.15); tween(arrow, {Position = UDim2.new(1, -26, 0, 0)}, 0.2) end)
	btn.MouseLeave:Connect(function() tween(btn, {BackgroundColor3 = danger and Color3.fromRGB(45, 22, 22) or TC(S.Theme.Card)}, 0.15); tween(arrow, {Position = UDim2.new(1, -30, 0, 0)}, 0.2) end)
	btn.MouseButton1Click:Connect(callback)
	local kbName = keybindName or text:gsub("[^%w]", "")
	btn.MouseButton2Click:Connect(function() ShowKeybindPopup(kbName, function(key) RegisterKeybind(kbName, callback, key); UpdateKeybindPanel(); Notify(L("hub_name"), kbName .. " -> " .. key, 2) end) end)
	return btn
end

local function InfoCard(parent, text, copyable)
	local f = Create("Frame", {Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); f:SetAttribute("OrigBT", 0); Corner(f, 10)
	local l = Create("TextLabel", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = f}); l:SetAttribute("OrigTT", 0)
	if copyable then
		local cbtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = f})
		cbtn.MouseButton1Click:Connect(function() local val = text:match(": (.+)$") or text; CopyToClipboard(val); Notify(L("hub_name"), L("copied") .. " " .. val, 2); tween(f, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.1); task.delay(0.3, function() tween(f, {BackgroundColor3 = TC(S.Theme.Card)}, 0.2) end) end)
		cbtn.MouseEnter:Connect(function() tween(f, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
		cbtn.MouseLeave:Connect(function() tween(f, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
	end
	return f, l
end

local function Dropdown(parent, text, options, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, ClipsDescendants = true, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 12)
	Create("TextLabel", {Size = UDim2.new(0.5, -10, 0, 42), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local selected = Create("TextButton", {Size = UDim2.new(0.48, -8, 0, 32), Position = UDim2.new(0.52, 0, 0, 5), BackgroundColor3 = TC(S.Theme.CardHover), Text = options[1] or "—", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, Parent = container}); selected:SetAttribute("OrigTT", 0); Corner(selected, 10)
	local arrow2 = Create("TextLabel", {Size = UDim2.new(0, 16, 1, 0), Position = UDim2.new(1, -20, 0, 0), BackgroundTransparency = 1, Text = "v", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 11, Parent = selected}); arrow2:SetAttribute("OrigTT", 0)
	local open = false
	local listFrame = Create("Frame", {Size = UDim2.new(0.48, -8, 0, 0), Position = UDim2.new(0.52, 0, 0, 40), BackgroundColor3 = TC(S.Theme.CardHover), BorderSizePixel = 0, ClipsDescendants = true, Parent = container}); Corner(listFrame, 10)
	Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = listFrame}); Pad(listFrame, 4, 4, 4, 4)
	local function buildOptions(opts)
		for _, ch in pairs(listFrame:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
		for _, opt in ipairs(opts) do
			local ob = Create("TextButton", {Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = TC(S.Theme.Card), Text = opt, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 13, BorderSizePixel = 0, Parent = listFrame}); Corner(ob, 8)
			ob.MouseEnter:Connect(function() tween(ob, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.1) end)
			ob.MouseLeave:Connect(function() tween(ob, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
			ob.MouseButton1Click:Connect(function() selected.Text = opt; open = false; tween(container, {Size = UDim2.new(1, 0, 0, 42)}, 0.25); tween(listFrame, {Size = UDim2.new(0.48, -8, 0, 0)}, 0.2); arrow2.Rotation = 0; callback(opt) end)
		end
	end
	buildOptions(options)
	selected.MouseButton1Click:Connect(function()
		open = not open; local h = #options * 34 + 10
		tween(container, {Size = UDim2.new(1, 0, 0, open and (42 + h) or 42)}, 0.3, Enum.EasingStyle.Back)
		tween(listFrame, {Size = UDim2.new(0.48, -8, 0, open and h or 0)}, 0.25); tween(arrow2, {Rotation = open and 180 or 0}, 0.2)
	end)
	return {Refresh = function(newOpts) options = newOpts; buildOptions(newOpts) end, SetSelected = function(val) selected.Text = val end}
end

-- ═══ COLOR PICKER ═══
local function ShowColorPickerPopup(title, default, onApply)
	pcall(function() CoreGui:FindFirstChild("NHColorPicker"):Destroy() end)
	ShowBlur()
	
	local cpGui = Create("ScreenGui", {Name = "NHColorPicker", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	pcall(ProtectGui, cpGui); cpGui.Parent = CoreGui

	local popup = Create("Frame", {Size = UDim2.new(0, 320, 0, 400), Position = UDim2.new(0.5, -160, 0.5, -200), BackgroundColor3 = TC(S.Theme.Bg), BorderSizePixel = 0, ZIndex = 201, Parent = cpGui})
	Corner(popup, 16); Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Parent = popup})

	Create("TextLabel", {Size = UDim2.new(1, -40, 0, 30), Position = UDim2.new(0, 14, 0, 8), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 202, Parent = popup})

	local currentH, currentS2, currentV = 0, 1, 1
	if default then
		currentH, currentS2, currentV = Color3.fromRGB(default[1], default[2], default[3]):ToHSV()
	end

	local preview = Create("Frame", {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(1, -64, 0, 38), BackgroundColor3 = Color3.fromHSV(currentH, currentS2, currentV), BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(preview, 12)
	Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0.5, Parent = preview})

	local paletteSize = 180
	local paletteFrame = Create("Frame", {Size = UDim2.new(0, paletteSize, 0, paletteSize), Position = UDim2.new(0, 14, 0, 38), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 202, ClipsDescendants = true, Parent = popup}); Corner(paletteFrame, 10)

	local hueOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromHSV(currentH, 1, 1), BorderSizePixel = 0, ZIndex = 203, Parent = paletteFrame})
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}), Parent = hueOverlay})

	local blackOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, ZIndex = 204, Parent = paletteFrame})
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)}), Rotation = 90, Parent = blackOverlay})

	local svCursor = Create("Frame", {Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(currentS2, -7, 1 - currentV, -7), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 206, Parent = paletteFrame})
	local svCursorInner = Create("Frame", {Size = UDim2.new(0, 12, 0, 12), Position = UDim2.new(0, 1, 0, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 207, Parent = svCursor}); Corner(svCursorInner, 6)
	Create("UIStroke", {Color = Color3.new(0, 0, 0), Thickness = 2, Parent = svCursorInner})

	local hueBarW = 18
	local hueBar = Create("Frame", {Size = UDim2.new(0, hueBarW, 0, paletteSize), Position = UDim2.new(0, 14 + paletteSize + 8, 0, 38), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 202, ClipsDescendants = true, Parent = popup}); Corner(hueBar, 8)

	local hueColors = {}
	for i = 0, 6 do table.insert(hueColors, ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6, 1, 1))) end
	Create("UIGradient", {Color = ColorSequence.new(hueColors), Rotation = 90, Parent = hueBar})

	local hueCursor = Create("Frame", {Size = UDim2.new(1, 4, 0, 6), Position = UDim2.new(0, -2, currentH, -3), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 206, Parent = hueBar}); Corner(hueCursor, 3)
	Create("UIStroke", {Color = Color3.new(0, 0, 0), Thickness = 1.5, Parent = hueCursor})

	local rgbY = 38 + paletteSize + 10
	local function makeRGBBox(label, xOff, defVal)
		Create("TextLabel", {Size = UDim2.new(0, 14, 0, 20), Position = UDim2.new(0, xOff, 0, rgbY), BackgroundTransparency = 1, Text = label, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 12, ZIndex = 202, Parent = popup})
		local box = Create("TextBox", {Size = UDim2.new(0, 44, 0, 26), Position = UDim2.new(0, xOff + 16, 0, rgbY - 3), BackgroundColor3 = TC(S.Theme.Card), Text = tostring(defVal), TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, ZIndex = 202, ClearTextOnFocus = false, Parent = popup}); Corner(box, 8)
		return box
	end
	local c = Color3.fromHSV(currentH, currentS2, currentV)
	local rBox = makeRGBBox("R", 14, math.floor(c.R * 255))
	local gBox = makeRGBBox("G", 84, math.floor(c.G * 255))
	local bBox = makeRGBBox("B", 154, math.floor(c.B * 255))

	Create("TextLabel", {Size = UDim2.new(0, 16, 0, 20), Position = UDim2.new(0, 218, 0, rgbY), BackgroundTransparency = 1, Text = "#", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 14, ZIndex = 202, Parent = popup})
	local hexBox = Create("TextBox", {Size = UDim2.new(0, 70, 0, 26), Position = UDim2.new(0, 234, 0, rgbY - 3), BackgroundColor3 = TC(S.Theme.Card), Text = string.format("%02X%02X%02X", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255)), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, ZIndex = 202, ClearTextOnFocus = false, Parent = popup}); Corner(hexBox, 8)

	local function updateFromHSV()
		local col = Color3.fromHSV(currentH, currentS2, currentV)
		preview.BackgroundColor3 = col
		rBox.Text = tostring(math.floor(col.R * 255)); gBox.Text = tostring(math.floor(col.G * 255)); bBox.Text = tostring(math.floor(col.B * 255))
		hexBox.Text = string.format("%02X%02X%02X", math.floor(col.R*255), math.floor(col.G*255), math.floor(col.B*255))
		hueOverlay.BackgroundColor3 = Color3.fromHSV(currentH, 1, 1)
		svCursor.Position = UDim2.new(currentS2, -7, 1 - currentV, -7)
		hueCursor.Position = UDim2.new(0, -2, currentH, -3)
		svCursorInner.BackgroundColor3 = col
	end

	local svDragging = false
	local svBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", ZIndex = 208, Parent = paletteFrame})
	svBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then svDragging = true; currentS2 = math.clamp((i.Position.X - paletteFrame.AbsolutePosition.X) / paletteFrame.AbsoluteSize.X, 0, 1); currentV = math.clamp(1 - (i.Position.Y - paletteFrame.AbsolutePosition.Y) / paletteFrame.AbsoluteSize.Y, 0, 1); updateFromHSV() end end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then svDragging = false end end)
	UIS.InputChanged:Connect(function(i) if svDragging and i.UserInputType == Enum.UserInputType.MouseMovement then currentS2 = math.clamp((i.Position.X - paletteFrame.AbsolutePosition.X) / paletteFrame.AbsoluteSize.X, 0, 1); currentV = math.clamp(1 - (i.Position.Y - paletteFrame.AbsolutePosition.Y) / paletteFrame.AbsoluteSize.Y, 0, 1); updateFromHSV() end end)

	local hueDragging = false
	local hueBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", ZIndex = 208, Parent = hueBar})
	hueBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then hueDragging = true; currentH = math.clamp((i.Position.Y - hueBar.AbsolutePosition.Y) / hueBar.AbsoluteSize.Y, 0, 1); updateFromHSV() end end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then hueDragging = false end end)
	UIS.InputChanged:Connect(function(i) if hueDragging and i.UserInputType == Enum.UserInputType.MouseMovement then currentH = math.clamp((i.Position.Y - hueBar.AbsolutePosition.Y) / hueBar.AbsoluteSize.Y, 0, 1); updateFromHSV() end end)

	local function applyRGB()
		local r = math.clamp(tonumber(rBox.Text) or 0, 0, 255); local g = math.clamp(tonumber(gBox.Text) or 0, 0, 255); local b = math.clamp(tonumber(bBox.Text) or 0, 0, 255)
		currentH, currentS2, currentV = Color3.fromRGB(r, g, b):ToHSV(); updateFromHSV()
	end
	rBox.FocusLost:Connect(applyRGB); gBox.FocusLost:Connect(applyRGB); bBox.FocusLost:Connect(applyRGB)

	hexBox.FocusLost:Connect(function()
		local hex = hexBox.Text:gsub("#", "")
		if #hex == 6 then
			local r = tonumber(hex:sub(1,2), 16) or 0; local g = tonumber(hex:sub(3,4), 16) or 0; local b = tonumber(hex:sub(5,6), 16) or 0
			currentH, currentS2, currentV = Color3.fromRGB(r, g, b):ToHSV(); updateFromHSV()
		end
	end)

	local presetY = rgbY + 34
	local presetColors = {{255,0,0},{255,127,0},{255,255,0},{0,255,0},{0,255,255},{0,127,255},{0,0,255},{127,0,255},{255,0,255},{255,255,255},{128,128,128},{0,0,0}}
	for i, pc in ipairs(presetColors) do
		local psw = Create("TextButton", {Size = UDim2.new(0, 22, 0, 22), Position = UDim2.new(0, 14 + (i-1) * 25, 0, presetY), BackgroundColor3 = Color3.fromRGB(pc[1], pc[2], pc[3]), Text = "", BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(psw, 8)
		Create("UIStroke", {Color = Color3.new(1,1,1), Thickness = 1, Transparency = 0.7, Parent = psw})
		psw.MouseButton1Click:Connect(function() currentH, currentS2, currentV = Color3.fromRGB(pc[1], pc[2], pc[3]):ToHSV(); updateFromHSV() end)
	end

	local btnY = presetY + 32
	local applyBtn = Create("TextButton", {Size = UDim2.new(0, 135, 0, 34), Position = UDim2.new(0, 14, 0, btnY), BackgroundColor3 = TC(S.Theme.Accent), Text = "Apply", TextColor3 = Color3.new(1,1,1), Font = Enum.Font.GothamBold, TextSize = 14, BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(applyBtn, 12)
	local closeBtn = Create("TextButton", {Size = UDim2.new(0, 135, 0, 34), Position = UDim2.new(0, 163, 0, btnY), BackgroundColor3 = TC(S.Theme.Card), Text = L("close"), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 14, BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(closeBtn, 12)

	applyBtn.MouseButton1Click:Connect(function()
		local col = Color3.fromHSV(currentH, currentS2, currentV)
		local result = {math.floor(col.R * 255), math.floor(col.G * 255), math.floor(col.B * 255)}
		onApply(result)
		HideBlur()
		cpGui:Destroy()
	end)
	closeBtn.MouseButton1Click:Connect(function() HideBlur(); cpGui:Destroy() end)

	do local dr, ds, sp
		popup.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then local ry = i.Position.Y - popup.AbsolutePosition.Y; if ry <= 36 then dr = true; ds = i.Position; sp = popup.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end) end end end)
		UIS.InputChanged:Connect(function(i) if dr and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - ds; popup.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y) end end)
	end
end

local function ColorPicker(parent, text, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 12)
	Create("TextLabel", {Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local preview = Create("Frame", {Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -48, 0.5, -15), BackgroundColor3 = TC(default), BorderSizePixel = 0, Parent = container}); preview:SetAttribute("OrigBT", 0); Corner(preview, 10)
	Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 0.7, Parent = preview})

	local pickBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = container})
	pickBtn.MouseButton1Click:Connect(function()
		ShowColorPickerPopup(text, default, function(c) default = c; preview.BackgroundColor3 = TC(c); callback(c) end)
	end)
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
end

-- ═══ SCREEN INFO GUI (FPS, Coordinates) ═══
local ScreenInfoGui = Create("ScreenGui", {Name = "NHScreenInfo", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, ScreenInfoGui); ScreenInfoGui.Parent = CoreGui

local FPSFrame = Create("Frame", {
	Size = UDim2.new(0, 100, 0, 30),
	Position = UDim2.new(0, 10, 0, 10),
	BackgroundColor3 = TC(S.Theme.Bg),
	BackgroundTransparency = 0.3,
	BorderSizePixel = 0,
	Visible = S.FPSCounter or false,
	Parent = ScreenInfoGui
})
Corner(FPSFrame, 10)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = FPSFrame})
local FPSLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "FPS: 60",
	TextColor3 = TC(S.FPSColor or {255, 255, 255}),
	Font = Enum.Font.GothamBold,
	TextSize = 14,
	Parent = FPSFrame
})

do
	local dr, ds, sp
	FPSFrame.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dr = true; ds = i.Position; sp = FPSFrame.Position
			i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end)
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if dr and i.UserInputType == Enum.UserInputType.MouseMovement then
			local d = i.Position - ds
			FPSFrame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
		end
	end)
end

local fpsValues = {}
task.spawn(function()
	while ScreenInfoGui.Parent do
		if S.FPSCounter then
			local fps = math.floor(1 / RunService.RenderStepped:Wait())
			table.insert(fpsValues, fps)
			if #fpsValues > 10 then table.remove(fpsValues, 1) end
			local avg = 0
			for _, v in ipairs(fpsValues) do avg = avg + v end
			avg = math.floor(avg / #fpsValues)
			FPSLabel.Text = "FPS: " .. avg
			FPSLabel.TextColor3 = TC(S.FPSColor or {255, 255, 255})
		end
		task.wait(0.1)
	end
end)

local CoordsFrame = Create("Frame", {
	Size = UDim2.new(0, 200, 0, 30),
	Position = UDim2.new(0, 10, 0, 50),
	BackgroundColor3 = TC(S.Theme.Bg),
	BackgroundTransparency = 0.3,
	BorderSizePixel = 0,
	Visible = S.Coordinates or false,
	Parent = ScreenInfoGui
})
Corner(CoordsFrame, 10)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = CoordsFrame})
local CoordsLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "X: 0 Y: 0 Z: 0",
	TextColor3 = TC(S.CoordsColor or {255, 255, 255}),
	Font = Enum.Font.GothamBold,
	TextSize = 12,
	Parent = CoordsFrame
})

do
	local dr, ds, sp
	CoordsFrame.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			dr = true; ds = i.Position; sp = CoordsFrame.Position
			i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end)
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if dr and i.UserInputType == Enum.UserInputType.MouseMovement then
			local d = i.Position - ds
			CoordsFrame.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
		end
	end)
end

task.spawn(function()
	while ScreenInfoGui.Parent do
		if S.Coordinates then
			pcall(function()
				local pos = getRoot().Position
				CoordsLabel.Text = string.format("X: %.1f Y: %.1f Z: %.1f", pos.X, pos.Y, pos.Z)
				CoordsLabel.TextColor3 = TC(S.CoordsColor or {255, 255, 255})
			end)
		end
		task.wait(0.1)
	end
end)

-- ═══ CROSSHAIR GUI ═══
local CrosshairGui = Create("ScreenGui", {Name = "NHCrosshair", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, CrosshairGui); CrosshairGui.Parent = CoreGui

local CrosshairFrame = Create("Frame", {
	Size = UDim2.new(0, 0, 0, 0),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	BackgroundTransparency = 1,
	Visible = S.Crosshair or false,
	Parent = CrosshairGui
})

local function UpdateCrosshair()
	for _, c in pairs(CrosshairFrame:GetChildren()) do c:Destroy() end
	if not S.Crosshair then CrosshairFrame.Visible = false; return end
	CrosshairFrame.Visible = true
	
	local size = S.CrosshairSize or 10
	local thickness = S.CrosshairThickness or 2
	local color = TC(S.CrosshairColor or {255, 255, 255})
	local gap = 4
	
	local top = Create("Frame", {Size = UDim2.new(0, thickness, 0, size), Position = UDim2.new(0.5, -thickness/2, 0.5, -size - gap), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Corner(top, 2)
	local bottom = Create("Frame", {Size = UDim2.new(0, thickness, 0, size), Position = UDim2.new(0.5, -thickness/2, 0.5, gap), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Corner(bottom, 2)
	local left = Create("Frame", {Size = UDim2.new(0, size, 0, thickness), Position = UDim2.new(0.5, -size - gap, 0.5, -thickness/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Corner(left, 2)
	local right = Create("Frame", {Size = UDim2.new(0, size, 0, thickness), Position = UDim2.new(0.5, gap, 0.5, -thickness/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Corner(right, 2)
	local dot = Create("Frame", {Size = UDim2.new(0, thickness + 2, 0, thickness + 2), Position = UDim2.new(0.5, -(thickness + 2)/2, 0.5, -(thickness + 2)/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Corner(dot, (thickness + 2)/2)
end

if S.Crosshair then UpdateCrosshair() end

-- ═══ KEYBIND PANEL ═══
local KBPanelGui = Create("ScreenGui", {Name = "NHKeybindPanel", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, KBPanelGui); KBPanelGui.Parent = CoreGui
local KBPanel = Create("Frame", {Size = UDim2.new(0, 230, 0, 60), Position = UDim2.new(0, 10, 0.5, -100), BackgroundColor3 = TC(S.Theme.Bg), BackgroundTransparency = 0.15, BorderSizePixel = 0, Visible = S.ShowKeybindPanel or false, Parent = KBPanelGui}); Corner(KBPanel, 14)
local KBPanelStroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = KBPanel})
local KBPanelTitle = Create("TextLabel", {Size = UDim2.new(1, -10, 0, 24), Position = UDim2.new(0, 10, 0, 4), BackgroundTransparency = 1, Text = "⌨️ Keybinds", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = KBPanel})
local KBList = Create("Frame", {Size = UDim2.new(1, -16, 1, -32), Position = UDim2.new(0, 8, 0, 28), BackgroundTransparency = 1, ClipsDescendants = true, Parent = KBPanel})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = KBList})

do local dragging, dStart, sPos
	KBPanel.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dStart = i.Position; sPos = KBPanel.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end) end end)
	UIS.InputChanged:Connect(function(i) if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - dStart; KBPanel.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y) end end)
end

function UpdateKeybindPanel()
	KBPanel.BackgroundColor3 = TC(S.Theme.Bg); KBPanelStroke.Color = TC(S.Theme.Accent); KBPanelTitle.TextColor3 = TC(S.Theme.Accent)
	for _, ch in pairs(KBList:GetChildren()) do if ch:IsA("TextLabel") then ch:Destroy() end end
	local count = 0
	local ah = string.format("%02x%02x%02x", S.Theme.Accent[1], S.Theme.Accent[2], S.Theme.Accent[3])
	for _, kb in ipairs(KeybindRegistry) do
		if kb.key and kb.key ~= "None" then
			count += 1; local st = kb.enabled and L("on") or L("off"); local sc = kb.enabled and Color3.fromRGB(80, 220, 100) or TC(S.Theme.SubText)
			local sh = string.format("%02x%02x%02x", math.floor(sc.R*255), math.floor(sc.G*255), math.floor(sc.B*255))
			local row = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, RichText = true, Parent = KBList})
			row.Text = '<font color="#'..ah..'">[' .. kb.key .. ']</font> ' .. kb.name .. ' <font color="#'..sh..'">' .. st .. '</font>'
		end
	end
	local tmKey = S.Keybinds.ToggleMenu or "RightControl"
	if tmKey ~= "None" then count += 1; Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, Text = "[" .. tmKey .. "] Toggle Menu", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = -1, Parent = KBList}) end
	if count == 0 then Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, Text = L("no_keybinds"), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = KBList}) end
	tween(KBPanel, {Size = UDim2.new(0, 230, 0, math.max(count * 20 + 38, 56))}, 0.2)
end
UpdateKeybindPanel()

-- ═══ CHAMS SYSTEM ═══
local chamsObjs = {}
local function ClearChams()
	for _, v in pairs(chamsObjs) do pcall(function() v:Destroy() end) end
	chamsObjs = {}
end

local function CreateChams(plr)
	if plr == Player or not plr.Character then return end
	for _, part in pairs(plr.Character:GetDescendants()) do
		if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
			for _, face in ipairs(Enum.NormalId:GetEnumItems()) do
				local sg = Instance.new("SurfaceGui")
				sg.Name = "NHChams"
				sg.Face = face
				sg.AlwaysOnTop = true
				sg.Brightness = 1
				sg.Adornee = part
				sg.Parent = CoreGui
				
				local fr = Instance.new("Frame")
				fr.Size = UDim2.new(1, 0, 1, 0)
				fr.BackgroundColor3 = TC(S.ChamsColor or {255, 0, 0})
				fr.BackgroundTransparency = 0.5
				fr.BorderSizePixel = 0
				fr.Parent = sg
				
				table.insert(chamsObjs, sg)
			end
		end
	end
end

local function RefreshChams()
	ClearChams()
	if not S.Chams then return end
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Character and plr ~= Player then
			CreateChams(plr)
		end
	end
end

-- ═══ ORBIT SYSTEM ═══
local orbitConn = nil
local orbitAngle = 0

local function StartOrbit()
	if orbitConn then orbitConn:Disconnect() end
	orbitConn = RunService.Heartbeat:Connect(function(dt)
		if not S.OrbitPlayer or S.OrbitTarget == "" then return end
		local target = Players:FindFirstChild(S.OrbitTarget)
		if not target or not target.Character then return end
		local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
		if not targetRoot then return end
		
		pcall(function()
			orbitAngle = orbitAngle + (S.OrbitSpeed or 1) * dt
			local x = math.cos(orbitAngle) * (S.OrbitDistance or 15)
			local z = math.sin(orbitAngle) * (S.OrbitDistance or 15)
			local newPos = targetRoot.Position + Vector3.new(x, 3, z)
			getRoot().CFrame = CFrame.new(newPos, targetRoot.Position)
		end)
	end)
end

local function StopOrbit()
	if orbitConn then orbitConn:Disconnect(); orbitConn = nil end
end

-- ═══ FLING & SPIN SYSTEM ═══
local flingConn = nil
local spinConn = nil

local function StartFling()
	if flingConn then flingConn:Disconnect() end
	flingConn = RunService.Heartbeat:Connect(function()
		if not S.Fling then return end
		pcall(function()
			local root = getRoot()
			local vel = root.AssemblyLinearVelocity
			root.AssemblyLinearVelocity = Vector3.new(vel.X, vel.Y, vel.Z) + root.CFrame.LookVector * S.FlingPower
			root.AssemblyAngularVelocity = Vector3.new(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
		end)
	end)
end

local function StopFling()
	if flingConn then flingConn:Disconnect(); flingConn = nil end
end

local function StartSpin()
	if spinConn then spinConn:Disconnect() end
	local root = getRoot()
	local av = Instance.new("BodyAngularVelocity")
	av.Name = "NHSpin"
	av.MaxTorque = Vector3.new(0, math.huge, 0)
	av.AngularVelocity = Vector3.new(0, S.SpinSpeed, 0)
	av.Parent = root
	
	spinConn = RunService.Heartbeat:Connect(function()
		if not S.Spin then return end
		pcall(function()
			local spin = root:FindFirstChild("NHSpin")
			if spin then
				spin.AngularVelocity = Vector3.new(0, S.SpinSpeed, 0)
			end
		end)
	end)
end

local function StopSpin()
	if spinConn then spinConn:Disconnect(); spinConn = nil end
	pcall(function() getRoot():FindFirstChild("NHSpin"):Destroy() end)
end
-- ═══ PAGE: MOVEMENT ═══
do
	local p = tabPages["tab_movement"]
	Section(p, L("sect_fly"))
	Toggle(p, L("fly"), S.Fly, function(on)
		S.Fly = on; local root = getRoot()
		if on then
			local bv = Instance.new("BodyVelocity"); bv.Name = "NHFly"; bv.MaxForce = Vector3.one * 9e9; bv.Velocity = Vector3.zero; bv.Parent = root
			local bg = Instance.new("BodyGyro"); bg.Name = "NHGyro"; bg.MaxTorque = Vector3.one * 9e9; bg.D = 0; bg.Parent = root
			local c; c = RunService.Heartbeat:Connect(function()
				if not S.Fly or not root or not root.Parent then pcall(function() bv:Destroy(); bg:Destroy() end); c:Disconnect(); return end
				local cam = workspace.CurrentCamera; local d = Vector3.zero
				if UIS:IsKeyDown(Enum.KeyCode.W) then d += cam.CFrame.LookVector end; if UIS:IsKeyDown(Enum.KeyCode.S) then d -= cam.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.A) then d -= cam.CFrame.RightVector end; if UIS:IsKeyDown(Enum.KeyCode.D) then d += cam.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then d += Vector3.yAxis end; if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then d -= Vector3.yAxis end
				bv.Velocity = d * S.FlySpeed; bg.CFrame = cam.CFrame
			end)
		else pcall(function() root:FindFirstChild("NHFly"):Destroy(); root:FindFirstChild("NHGyro"):Destroy() end) end
	end, "Fly")
	SliderCompact(p, L("fly_speed"), 10, 300, S.FlySpeed, function(v) S.FlySpeed = v end)
	
	Section(p, L("sect_walk"))
	Toggle(p, L("speed_override"), S.Speed, function(on) S.Speed = on; getHum().WalkSpeed = on and S.WalkSpeed or 16 end, "SpeedOverride")
	SliderCompact(p, L("walkspeed"), 0, 500, S.WalkSpeed, function(v) S.WalkSpeed = v; if S.Speed then pcall(function() getHum().WalkSpeed = v end) end end)
	
	Section(p, L("sect_jump"))
	Toggle(p, L("jump_override"), S.JumpBoost, function(on) S.JumpBoost = on; local h = getHum(); h.UseJumpPower = true; h.JumpPower = on and S.JumpPower or 50 end, "JumpOverride")
	SliderCompact(p, L("jumppower"), 0, 500, S.JumpPower, function(v) S.JumpPower = v; if S.JumpBoost then pcall(function() getHum().UseJumpPower = true; getHum().JumpPower = v end) end end)
	
	Section(p, L("sect_infjump"))
	Toggle(p, L("inf_jump"), S.InfJump, function(on) S.InfJump = on end, "InfJump")
	UIS.JumpRequest:Connect(function() if S.InfJump then pcall(function() getHum():ChangeState(Enum.HumanoidStateType.Jumping) end) end end)
	
	Section(p, L("sect_noclip"))
	Toggle(p, L("noclip"), S.Noclip, function(on) S.Noclip = on end, "Noclip")
	RunService.Stepped:Connect(function() if S.Noclip then pcall(function() for _, p2 in pairs(getChar():GetDescendants()) do if p2:IsA("BasePart") then p2.CanCollide = false end end end) end end)
	
	-- ═══ FLING & SPIN ═══
	Section(p, L("sect_fling"))
	
	Toggle(p, L("fling"), S.Fling, function(on)
		S.Fling = on
		if on then
			StartFling()
		else
			StopFling()
		end
	end, "Fling")
	SliderCompact(p, L("fling_power"), 50, 2000, S.FlingPower or 500, function(v) S.FlingPower = v end)
	
	Toggle(p, L("walk_fling"), S.WalkFling, function(on)
		S.WalkFling = on
		if on then
			pcall(function()
				getHum().WalkSpeed = 200
				local root = getRoot()
				local conn
				conn = RunService.Heartbeat:Connect(function()
					if not S.WalkFling then conn:Disconnect(); return end
					pcall(function()
						root.AssemblyAngularVelocity = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
					end)
				end)
			end)
		else
			pcall(function()
				getHum().WalkSpeed = S.Speed and S.WalkSpeed or 16
				getRoot().AssemblyAngularVelocity = Vector3.zero
			end)
		end
	end, "WalkFling")
	
	Toggle(p, L("fly_fling"), S.FlyFling, function(on)
		S.FlyFling = on
		if on then
			pcall(function()
				local root = getRoot()
				local bv = Instance.new("BodyVelocity")
				bv.Name = "NHFlyFling"
				bv.MaxForce = Vector3.one * 9e9
				bv.Parent = root
				
				local conn
				conn = RunService.Heartbeat:Connect(function()
					if not S.FlyFling then 
						pcall(function() root:FindFirstChild("NHFlyFling"):Destroy() end)
						conn:Disconnect()
						return 
					end
					pcall(function()
						local cam = workspace.CurrentCamera
						local dir = Vector3.zero
						if UIS:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
						if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
						if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
						if UIS:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
						if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.yAxis end
						if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.yAxis end
						bv.Velocity = dir * 150
						root.AssemblyAngularVelocity = Vector3.new(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100))
					end)
				end)
			end)
		else
			pcall(function()
				getRoot():FindFirstChild("NHFlyFling"):Destroy()
				getRoot().AssemblyAngularVelocity = Vector3.zero
			end)
		end
	end, "FlyFling")
	
	Toggle(p, L("spin"), S.Spin, function(on)
		S.Spin = on
		if on then
			StartSpin()
		else
			StopSpin()
		end
	end, "Spin")
	SliderCompact(p, L("spin_speed"), 1, 100, S.SpinSpeed or 20, function(v) 
		S.SpinSpeed = v 
		pcall(function()
			local spin = getRoot():FindFirstChild("NHSpin")
			if spin then spin.AngularVelocity = Vector3.new(0, v, 0) end
		end)
	end)
	
	-- Orbit Player
	Section(p, L("sect_orbit"))
	
	local playerNames = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then table.insert(playerNames, plr.Name) end
	end
	if #playerNames == 0 then table.insert(playerNames, "No players") end
	
	local orbitDD = Dropdown(p, L("select_player"), playerNames, function(val)
		S.OrbitTarget = val
	end)
	
	Toggle(p, L("orbit_player"), S.OrbitPlayer, function(on)
		S.OrbitPlayer = on
		if on then StartOrbit() else StopOrbit() end
	end, "OrbitPlayer")
	
	SliderCompact(p, L("orbit_speed"), 1, 10, S.OrbitSpeed or 1, function(v) S.OrbitSpeed = v end)
	SliderCompact(p, L("orbit_distance"), 5, 50, S.OrbitDistance or 15, function(v) S.OrbitDistance = v end)
	
	Players.PlayerAdded:Connect(function(plr)
		task.wait(1)
		local names = {}
		for _, p2 in pairs(Players:GetPlayers()) do if p2 ~= Player then table.insert(names, p2.Name) end end
		if #names == 0 then table.insert(names, "No players") end
		orbitDD.Refresh(names)
	end)
	Players.PlayerRemoving:Connect(function()
		task.wait(0.5)
		local names = {}
		for _, p2 in pairs(Players:GetPlayers()) do if p2 ~= Player then table.insert(names, p2.Name) end end
		if #names == 0 then table.insert(names, "No players") end
		orbitDD.Refresh(names)
	end)
end

-- ═══ PAGE: VISUAL ═══
do
	local p = tabPages["tab_visual"]
	local espObjs, tracerObjs, boxObjs = {}, {}, {}
	local rainbowConn = nil
	local function clearESP() for _, v in pairs(espObjs) do pcall(function() v:Destroy() end) end; espObjs = {}; for _, v in pairs(tracerObjs) do pcall(function() v:Remove() end) end; tracerObjs = {}; for _, v in pairs(boxObjs) do pcall(function() v:Destroy() end) end; boxObjs = {} end
	local function makeESP(plr)
		if plr == Player or not plr.Character then return end
		local hl = Instance.new("Highlight"); hl.FillColor = TC(S.ESPColor); hl.OutlineColor = TC(S.ESPOutline); hl.FillTransparency = S.ESPFillTransparency; hl.OutlineTransparency = 0; hl.Adornee = plr.Character; hl.Parent = Gui; table.insert(espObjs, hl)
		if S.ESPShowName or S.ESPShowHealth then
			local bb = Instance.new("BillboardGui"); bb.Size = UDim2.new(0, 200, 0, 50); bb.StudsOffset = Vector3.new(0, 3.5, 0); bb.AlwaysOnTop = true; bb.Adornee = plr.Character:FindFirstChild("Head"); bb.Parent = Gui; table.insert(espObjs, bb)
			if S.ESPShowName then Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, Text = plr.DisplayName .. " [" .. plr.Name .. "]", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold, TextSize = 14, TextStrokeTransparency = 0.4, Parent = bb}) end
			if S.ESPShowHealth then local hum2 = plr.Character:FindFirstChildOfClass("Humanoid"); if hum2 then Create("TextLabel", {Size = UDim2.new(1, 0, 0, 14), Position = UDim2.new(0, 0, 0, 18), BackgroundTransparency = 1, Text = math.floor(hum2.Health) .. " / " .. math.floor(hum2.MaxHealth), TextColor3 = Color3.fromRGB(100, 255, 100), Font = Enum.Font.GothamSemibold, TextSize = 12, TextStrokeTransparency = 0.4, Parent = bb}) end end
		end
		if S.ESPBoxes then local r2 = plr.Character:FindFirstChild("HumanoidRootPart"); if r2 then local box = Instance.new("BillboardGui"); box.Size = UDim2.new(4, 0, 5.5, 0); box.AlwaysOnTop = true; box.Adornee = r2; box.Parent = Gui; table.insert(boxObjs, box); Create("UIStroke", {Color = TC(S.ESPColor), Thickness = 2, Transparency = 0.3, Parent = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = box})}) end end
	end
	local function refreshESP()
		clearESP(); if not S.ESP then return end
		for _, plr in pairs(Players:GetPlayers()) do
			if plr.Character and plr ~= Player then
				if S.ESPTeamCheck and plr.Team == Player.Team then continue end
				local r2 = plr.Character:FindFirstChild("HumanoidRootPart"); if r2 then local d = (getRoot().Position - r2.Position).Magnitude; if d <= S.ESPDistance then makeESP(plr) end end
			end
		end
	end
	local function startRainbow()
		if rainbowConn then return end
		rainbowConn = RunService.Heartbeat:Connect(function()
			if not S.ESPRainbow or not S.ESP then if rainbowConn then rainbowConn:Disconnect(); rainbowConn = nil end; return end
			local col = Color3.fromHSV((tick() % 5) / 5, 1, 1)
			for _, obj in pairs(espObjs) do pcall(function() if obj:IsA("Highlight") then obj.FillColor = col; obj.OutlineColor = col end end) end
		end)
	end

	Section(p, L("sect_esp"))
	
	-- ═══ FIXED ESP PREVIEW (Animated) ═══
	local espPreviewContainer = Create("Frame", {Size = UDim2.new(1, 0, 0, 200), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); espPreviewContainer:SetAttribute("OrigBT", 0); Corner(espPreviewContainer, 12)
	
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 24), Position = UDim2.new(0, 0, 0, 6), BackgroundTransparency = 1, Text = "👁 " .. L("esp_preview"), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 13, Parent = espPreviewContainer}):SetAttribute("OrigTT", 0)
	
	local previewArea = Create("Frame", {Size = UDim2.new(1, -20, 0, 160), Position = UDim2.new(0, 10, 0, 32), BackgroundColor3 = Color3.fromRGB(8, 8, 14), BorderSizePixel = 0, ClipsDescendants = true, Parent = espPreviewContainer}); previewArea:SetAttribute("OrigBT", 0); Corner(previewArea, 10)

	local thumbUrl = ""
	pcall(function()
		thumbUrl = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size352x352)
	end)

	local avatarImg = Create("ImageLabel", {
		Size = UDim2.new(0, 80, 0, 100),
		Position = UDim2.new(0.5, -40, 0.5, -50),
		BackgroundTransparency = 1,
		Image = thumbUrl,
		Parent = previewArea
	})

	local espPreviewColor = TC(S.ESPColor)
	local boxFrame = Create("Frame", {Size = UDim2.new(0, 90, 0, 130), Position = UDim2.new(0.5, -45, 0.5, -65), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = previewArea})
	local espStroke = Create("UIStroke", {Color = espPreviewColor, Thickness = 2, Transparency = S.ESPBoxes and 0 or 0.7, Parent = boxFrame}); Corner(boxFrame, 4)

	local fillOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = espPreviewColor, BackgroundTransparency = S.ESPFillTransparency, BorderSizePixel = 0, ZIndex = 0, Parent = boxFrame}); Corner(fillOverlay, 4)

	local nameTag = Create("TextLabel", {Size = UDim2.new(0, 200, 0, 16), Position = UDim2.new(0.5, -100, 0, 8), BackgroundTransparency = 1, Text = Player.DisplayName, TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold, TextSize = 12, TextStrokeTransparency = 0.3, Visible = S.ESPShowName, Parent = previewArea}):SetAttribute("OrigTT", 0)

	local healthTag = Create("TextLabel", {Size = UDim2.new(0, 200, 0, 12), Position = UDim2.new(0.5, -100, 0, 24), BackgroundTransparency = 1, Text = "100 / 100", TextColor3 = Color3.fromRGB(100, 255, 100), Font = Enum.Font.GothamSemibold, TextSize = 10, TextStrokeTransparency = 0.3, Visible = S.ESPShowHealth, Parent = previewArea}):SetAttribute("OrigTT", 0)

	local tracerLine = Create("Frame", {Size = UDim2.new(0, 2, 0, 30), Position = UDim2.new(0.5, -1, 1, -32), BackgroundColor3 = espPreviewColor, BorderSizePixel = 0, Visible = S.ESPTracers, Parent = previewArea})
	Corner(tracerLine, 1)

	local distLabel = Create("TextLabel", {Size = UDim2.new(0, 80, 0, 12), Position = UDim2.new(0.5, -40, 1, -14), BackgroundTransparency = 1, Text = "42 studs", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 9, Parent = previewArea}):SetAttribute("OrigTT", 0)

	-- Live update preview function
	local function updateESPPreview()
		local col = TC(S.ESPColor)
		espStroke.Color = col
		espStroke.Transparency = S.ESPBoxes and 0 or 0.7
		fillOverlay.BackgroundColor3 = col
		fillOverlay.BackgroundTransparency = S.ESPFillTransparency
		tracerLine.BackgroundColor3 = col
		tracerLine.Visible = S.ESPTracers
		nameTag.Visible = S.ESPShowName
		healthTag.Visible = S.ESPShowHealth
	end

	-- Animated ESP preview (breathing effect + rainbow)
	task.spawn(function()
		local breatheDir = 1
		local breatheVal = 0
		while espPreviewContainer.Parent do
			-- Rainbow effect
			if S.ESPRainbow then
				local col = Color3.fromHSV((tick() % 5) / 5, 1, 1)
				espStroke.Color = col
				fillOverlay.BackgroundColor3 = col
				tracerLine.BackgroundColor3 = col
			end
			
			-- Breathing/pulsing effect for box
			breatheVal = breatheVal + 0.05 * breatheDir
			if breatheVal >= 1 then breatheDir = -1 elseif breatheVal <= 0 then breatheDir = 1 end
			local pulseScale = 1 + (breatheVal * 0.02)
			boxFrame.Size = UDim2.new(0, 90 * pulseScale, 0, 130 * pulseScale)
			boxFrame.Position = UDim2.new(0.5, -45 * pulseScale, 0.5, -65 * pulseScale)
			
			-- Animate distance text
			local fakeDist = 40 + math.sin(tick() * 2) * 5
			distLabel.Text = string.format("%.0f studs", fakeDist)
			
			task.wait(0.03)
		end
	end)

	Toggle(p, L("esp"), S.ESP, function(on) S.ESP = on; refreshESP(); if on and S.ESPRainbow then startRainbow() end end, "ESP")
	Toggle(p, L("esp_names"), S.ESPShowName, function(on) S.ESPShowName = on; refreshESP(); updateESPPreview() end)
	Toggle(p, L("esp_health"), S.ESPShowHealth, function(on) S.ESPShowHealth = on; refreshESP(); updateESPPreview() end)
	Toggle(p, L("esp_team"), S.ESPTeamCheck, function(on) S.ESPTeamCheck = on; refreshESP() end)
	Toggle(p, L("esp_boxes"), S.ESPBoxes, function(on) S.ESPBoxes = on; refreshESP(); updateESPPreview() end, "BoxESP")
	Toggle(p, L("esp_tracers"), S.ESPTracers, function(on) S.ESPTracers = on; refreshESP(); updateESPPreview() end, "Tracers")
	Toggle(p, L("esp_rainbow"), S.ESPRainbow, function(on) S.ESPRainbow = on; if on and S.ESP then startRainbow() else if rainbowConn then rainbowConn:Disconnect(); rainbowConn = nil end end; updateESPPreview() end, "RainbowESP")
	Slider(p, L("esp_dist"), 100, 5000, S.ESPDistance, function(v) S.ESPDistance = v end)
	Slider(p, L("esp_fill"), 0, 100, math.floor(S.ESPFillTransparency * 100), function(v) S.ESPFillTransparency = v / 100; refreshESP(); updateESPPreview() end)
	
	-- Chams
	Toggle(p, L("chams"), S.Chams, function(on) S.Chams = on; RefreshChams() end, "Chams")
	ColorPicker(p, L("chams") .. " Color", S.ChamsColor or {255, 0, 0}, function(c) S.ChamsColor = c; RefreshChams() end)

	task.spawn(function() while Gui.Parent do if S.ESP then refreshESP() end; if S.Chams then RefreshChams() end; task.wait(3) end end)

	-- Screen Info Section
	Section(p, L("sect_screen_info"))
	Toggle(p, L("fps_counter"), S.FPSCounter, function(on) S.FPSCounter = on; FPSFrame.Visible = on end, "FPSCounter")
	ColorPicker(p, L("fps_counter") .. " Color", S.FPSColor or {255, 255, 255}, function(c) S.FPSColor = c; FPSLabel.TextColor3 = TC(c) end)
	Toggle(p, L("coordinates"), S.Coordinates, function(on) S.Coordinates = on; CoordsFrame.Visible = on end, "Coordinates")
	ColorPicker(p, L("coordinates") .. " Color", S.CoordsColor or {255, 255, 255}, function(c) S.CoordsColor = c; CoordsLabel.TextColor3 = TC(c) end)
	
	-- Crosshair
	Section(p, L("crosshair"))
	Toggle(p, L("crosshair"), S.Crosshair, function(on) S.Crosshair = on; UpdateCrosshair() end, "Crosshair")
	ColorPicker(p, L("crosshair_color"), S.CrosshairColor or {255, 255, 255}, function(c) S.CrosshairColor = c; UpdateCrosshair() end)
	SliderCompact(p, L("crosshair_size"), 5, 30, S.CrosshairSize or 10, function(v) S.CrosshairSize = v; UpdateCrosshair() end)
	SliderCompact(p, L("crosshair_thickness"), 1, 6, S.CrosshairThickness or 2, function(v) S.CrosshairThickness = v; UpdateCrosshair() end)

	-- Camera Section
	Section(p, L("sect_camera"))
	Slider(p, L("fov_changer"), 30, 120, S.FOV or 70, function(v)
		S.FOV = v
		pcall(function() workspace.CurrentCamera.FieldOfView = v end)
	end)
	
	Slider(p, L("max_zoom"), 10, 1000, S.MaxZoom or 128, function(v)
		S.MaxZoom = v
		pcall(function()
			Player.CameraMaxZoomDistance = v
		end)
	end)

	Section(p, L("sect_lighting"))
	Toggle(p, L("fullbright"), S.Fullbright, function(on) S.Fullbright = on; if on then Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.FogEnd = 100000; Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(1, 1, 1); Lighting.OutdoorAmbient = Color3.new(1, 1, 1) else Lighting.Brightness = 1; Lighting.GlobalShadows = true; Lighting.Ambient = Color3.fromRGB(127, 127, 127); Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127) end end, "Fullbright")
	Toggle(p, L("no_fog"), S.NoFog, function(on) S.NoFog = on; Lighting.FogStart = 0; Lighting.FogEnd = on and 9999999 or 1000 end, "NoFog")
	
	Slider(p, L("day_night_cycle"), 0, 24, S.DayNightTime or 14, function(v)
		S.DayNightTime = v
		pcall(function() Lighting.ClockTime = v end)
	end)

	local savedLS = {}
	Toggle(p, L("anti_lag"), S.AntiLag, function(on)
		S.AntiLag = on
		if on then
			savedLS.GS = Lighting.GlobalShadows; pcall(function() savedLS.T = Lighting.Technology end)
			pcall(function() Lighting.GlobalShadows = false; Lighting.Technology = Enum.Technology.Compatibility end)
			pcall(function() for _, v in pairs(Lighting:GetChildren()) do if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("ColorCorrectionEffect") then v.Enabled = false; v:SetAttribute("NHD", true) end end end)
			pcall(function() for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = false; v:SetAttribute("NHD", true) elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1; v:SetAttribute("NHD", true) end end end)
			pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
		else
			pcall(function() Lighting.GlobalShadows = savedLS.GS or true; if savedLS.T then Lighting.Technology = savedLS.T end end)
			pcall(function() for _, v in pairs(Lighting:GetChildren()) do if v:GetAttribute("NHD") then v.Enabled = true; v:SetAttribute("NHD", nil) end end end)
			pcall(function() for _, v in pairs(workspace:GetDescendants()) do if v:GetAttribute("NHD") then if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then v.Enabled = true elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 0 end; v:SetAttribute("NHD", nil) end end end)
			pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
		end
	end, "AntiLag")
	
	-- Custom Skybox
	Section(p, L("custom_skybox"))
	local skyboxInput = Create("Frame", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); skyboxInput:SetAttribute("OrigBT", 0); Corner(skyboxInput, 12)
	local skyboxBox = Create("TextBox", {Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, PlaceholderText = "Skybox Asset ID (e.g., rbxassetid://12345)", PlaceholderColor3 = TC(S.Theme.SubText), Text = S.CustomSkybox or "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = skyboxInput}); skyboxBox:SetAttribute("OrigTT", 0)
	
	Button(p, "Apply Skybox", function()
		S.CustomSkybox = skyboxBox.Text
		pcall(function()
			local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
			sky.SkyboxBk = S.CustomSkybox
			sky.SkyboxDn = S.CustomSkybox
			sky.SkyboxFt = S.CustomSkybox
			sky.SkyboxLf = S.CustomSkybox
			sky.SkyboxRt = S.CustomSkybox
			sky.SkyboxUp = S.CustomSkybox
		end)
		Notify(L("hub_name"), "Skybox Applied!", 2)
	end)
	
	Button(p, "Reset Skybox", function()
		pcall(function()
			local sky = Lighting:FindFirstChildOfClass("Sky")
			if sky then sky:Destroy() end
		end)
		Notify(L("hub_name"), "Skybox Reset!", 2)
	end)
end

-- ═══ PAGE: MISC ═══
do
	local p = tabPages["tab_misc"]
	Section(p, L("sect_player"))
	local stunConn, stunPos
	Toggle(p, L("stun"), false, function(on)
		if on then stunPos = getRoot().CFrame; getHum().WalkSpeed = 0; getHum().JumpPower = 0; stunConn = RunService.Heartbeat:Connect(function() pcall(function() getRoot().CFrame = stunPos; getRoot().AssemblyLinearVelocity = Vector3.zero; getRoot().AssemblyAngularVelocity = Vector3.zero end) end)
		else if stunConn then stunConn:Disconnect() end; pcall(function() getHum().WalkSpeed = S.Speed and S.WalkSpeed or 16; getHum().JumpPower = S.JumpBoost and S.JumpPower or 50 end) end
	end, "Stun")

	local ragdollConn
	Toggle(p, L("ragdoll"), false, function(on)
		S.Ragdoll = on
		if on then
			pcall(function()
				local char, hum = getChar(), getHum(); hum:ChangeState(Enum.HumanoidStateType.Physics)
				for _, j in pairs(char:GetDescendants()) do
					if j:IsA("Motor6D") then
						local a0 = Instance.new("Attachment"); a0.Name = "NHRAtt"; a0.Parent = j.Part0; a0.CFrame = j.C0
						local a1 = Instance.new("Attachment"); a1.Name = "NHRAtt"; a1.Parent = j.Part1; a1.CFrame = j.C1
						local bs = Instance.new("BallSocketConstraint"); bs.Name = "NHRag"; bs.Attachment0 = a0; bs.Attachment1 = a1; bs.LimitsEnabled = true; bs.TwistLimitsEnabled = true; bs.UpperAngle = 90; bs.Parent = j.Parent
						j.Enabled = false; j:SetAttribute("NHR", true)
					end
				end
				ragdollConn = RunService.Heartbeat:Connect(function() if not S.Ragdoll then return end; pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end) end)
			end)
		else
			if ragdollConn then ragdollConn:Disconnect(); ragdollConn = nil end
			pcall(function()
				local char, hum = getChar(), getHum()
				for _, j in pairs(char:GetDescendants()) do
					if j:IsA("Motor6D") and j:GetAttribute("NHR") then j.Enabled = true; j:SetAttribute("NHR", nil) end
					if j.Name == "NHRag" or j.Name == "NHRAtt" then j:Destroy() end
				end
				hum:ChangeState(Enum.HumanoidStateType.GettingUp)
			end)
		end
	end, "Ragdoll")

	Section(p, L("sect_reset"))
	Button(p, L("reset_char"), function() pcall(function() getHum().Health = 0 end) end, true)

	-- ═══ FPS UNLOCKER ═══
	Section(p, "Performance")
	Button(p, L("fps_unlocker"), function()
		pcall(function()
			if setfpscap then
				setfpscap(9999)
				Notify(L("hub_name"), "FPS Unlocked! (Cap set to 9999)", 3)
			elseif unlockfps then
				unlockfps()
				Notify(L("hub_name"), "FPS Unlocked!", 3)
			else
				Notify(L("hub_name"), "FPS Unlocker not supported on this executor", 4)
			end
		end)
	end)
	
	Button(p, "Set FPS Cap: 60", function()
		pcall(function()
			if setfpscap then setfpscap(60); Notify(L("hub_name"), "FPS Cap: 60", 2) end
		end)
	end)
	
	Button(p, "Set FPS Cap: 144", function()
		pcall(function()
			if setfpscap then setfpscap(144); Notify(L("hub_name"), "FPS Cap: 144", 2) end
		end)
	end)
	
	Button(p, "Set FPS Cap: 240", function()
		pcall(function()
			if setfpscap then setfpscap(240); Notify(L("hub_name"), "FPS Cap: 240", 2) end
		end)
	end)

	Section(p, L("sect_tools"))
	Button(p, L("btools_all"), function() pcall(function() local bp = Player.Backpack; Instance.new("HopperBin", bp).BinType = 4; Instance.new("HopperBin", bp).BinType = 3; Instance.new("HopperBin", bp).BinType = 2 end) end)
	Button(p, L("btools_delete"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = 4; h.Parent = Player.Backpack end) end)
	Button(p, L("btools_copy"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = 3; h.Parent = Player.Backpack end) end)
	Button(p, L("btools_replace"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = 2; h.Parent = Player.Backpack end) end)
	Button(p, L("tp_tool"), function() local t = Instance.new("Tool"); t.Name = "TP Tool"; t.RequiresHandle = false; t.CanBeDropped = false; t.Parent = Player.Backpack; t.Activated:Connect(function() pcall(function() getRoot().CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 4, 0)) end) end) end)

	Section(p, L("sect_inventory"))
	Button(p, L("give_all_tools"), function() local c = 0; for _, obj in pairs(ReplicatedStorage:GetDescendants()) do if obj:IsA("Tool") then obj.Parent = Player.Backpack; c += 1 end end; Notify(L("hub_name"), string.format(L("unlocked_tools"), c), 3) end)
	Button(p, L("enable_inventory"), function() pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true) end) end)
	Button(p, L("enable_shiftlock"), function() pcall(function() Player.DevEnableMouseLock = true end) end)

	Section(p, L("sect_teleport"))
	Toggle(p, L("click_tp"), S.ClickTP, function(on) S.ClickTP = on end, "ClickTP")
	Mouse.Button1Down:Connect(function() if S.ClickTP and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then pcall(function() getRoot().CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 4, 0)) end) end end)

	Section(p, L("sect_scripts"))
	Button(p, L("open_iy"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end) end)
	Button(p, L("open_dex"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end) end)
	Button(p, L("open_spy"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))() end) end)
	Button(p, L("open_owl"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))() end) end)

	Section(p, L("sect_anti"))
	Toggle(p, L("anti_afk"), S.AntiAFK, function(on) S.AntiAFK = on end, "AntiAFK")
	Player.Idled:Connect(function() if S.AntiAFK then pcall(function() game:GetService("VirtualUser"):CaptureController(); game:GetService("VirtualUser"):ClickButton2(Vector2.zero) end) end end)
end

-- ═══ PAGE: SETTINGS ═══
do
	local p = tabPages["tab_settings"]

	Section(p, L("language"))
	local langOpts = {"EN — English", "RU — Русский", "JP — 日本語", "ES — Español"}
	local curLD = "EN — English"; for _, o in ipairs(langOpts) do if o:sub(1, 2) == CurrentLang then curLD = o; break end end
	local langDD = Dropdown(p, L("select_lang"), langOpts, function(val) local code = val:sub(1, 2); CurrentLang = code; S.Language = code; SaveLanguage(code); Notify(L("hub_name"), "Language -> " .. val .. "\nReload to fully apply.", 4) end)
	langDD.SetSelected(curLD)

	Section(p, L("keybinds"))
	InfoCard(p, L("right_click_hint"))
	Toggle(p, L("show_keybind_panel"), S.ShowKeybindPanel or false, function(on) S.ShowKeybindPanel = on; KBPanel.Visible = on end)

	local tmKeyC = Create("Frame", {Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); tmKeyC:SetAttribute("OrigBT", 0); Corner(tmKeyC, 12)
	Create("TextLabel", {Size = UDim2.new(0.55, -10, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = L("toggle_key"), TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = tmKeyC}):SetAttribute("OrigTT", 0)
	local tmKeyBtn = Create("TextButton", {Size = UDim2.new(0.38, 0, 0, 32), Position = UDim2.new(0.58, 0, 0.5, -16), BackgroundColor3 = TC(S.Theme.CardHover), Text = S.Keybinds.ToggleMenu or "RightControl", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, Parent = tmKeyC}); tmKeyBtn:SetAttribute("OrigTT", 0); Corner(tmKeyBtn, 10)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.7, Parent = tmKeyBtn})
	local tmL = false
	tmKeyBtn.MouseButton1Click:Connect(function()
		if tmL then return end; tmL = true; tmKeyBtn.Text = L("press_key"); tween(tmKeyBtn, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.15); tmKeyBtn.TextColor3 = Color3.new(1, 1, 1)
		local conn; conn = UIS.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Keyboard then 
				local keyName = input.KeyCode.Name
				local existingUser = FindKeybindByKey(keyName)
				if existingUser and existingUser ~= "ToggleMenu" then
					Notify(L("hub_name"), string.format(L("keybind_already_used"), keyName, existingUser), 3)
					tween(tmKeyBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15); tmKeyBtn.TextColor3 = TC(S.Theme.Accent)
					tmKeyBtn.Text = S.Keybinds.ToggleMenu or "RightControl"
					tmL = false; conn:Disconnect()
					return
				end
				S.Keybinds.ToggleMenu = keyName; tmKeyBtn.Text = keyName; tween(tmKeyBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15); tmKeyBtn.TextColor3 = TC(S.Theme.Accent); tmL = false; conn:Disconnect(); UpdateKeybindPanel() 
			end
		end)
	end)
	tmKeyC.MouseEnter:Connect(function() tween(tmKeyC, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
	tmKeyC.MouseLeave:Connect(function() tween(tmKeyC, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)

	Button(p, L("clear_all_keybinds"), function()
		for _, kb in ipairs(KeybindRegistry) do kb.key = "None" end
		for k, _ in pairs(S.Keybinds) do if k ~= "ToggleMenu" then S.Keybinds[k] = "None" end end
		UpdateKeybindPanel()
		Notify(L("hub_name"), L("clear_all_keybinds") .. " done!", 3)
	end, true)

	Section(p, L("configs"))
	
	local pathCard = Create("Frame", {Size = UDim2.new(1, 0, 0, 28), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); pathCard:SetAttribute("OrigBT", 0); Corner(pathCard, 10)
	Create("TextLabel", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "📁 " .. L("configs_path") .. " " .. ConfigDir .. "/Configs/", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = pathCard}):SetAttribute("OrigTT", 0)

	local cfgIF = Create("Frame", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); cfgIF:SetAttribute("OrigBT", 0); Corner(cfgIF, 12)
	local cfgBox = Create("TextBox", {Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, PlaceholderText = L("config_name"), PlaceholderColor3 = TC(S.Theme.SubText), Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = cfgIF}); cfgBox:SetAttribute("OrigTT", 0)
	local configDD = Dropdown(p, L("select_config"), GetConfigs(), function(val) cfgBox.Text = val end)
	Button(p, L("save_config"), function() local n = cfgBox.Text; if n == "" then n = "default" end; SaveConfig(n); configDD.Refresh(GetConfigs()); Notify(L("hub_name"), "'" .. n .. "' " .. L("saved"), 3) end)
	Button(p, L("load_config"), function()
		local n = cfgBox.Text; if n == "" then n = "default" end; LoadConfig(n)
		task.defer(function()
			local m = {Fly=S.Fly, SpeedOverride=S.Speed, JumpOverride=S.JumpBoost, InfJump=S.InfJump, Noclip=S.Noclip, ESP=S.ESP, Fullbright=S.Fullbright, NoFog=S.NoFog, AntiLag=S.AntiLag, ClickTP=S.ClickTP, AntiAFK=S.AntiAFK, Ragdoll=S.Ragdoll, FPSCounter=S.FPSCounter, Coordinates=S.Coordinates, Crosshair=S.Crosshair, Chams=S.Chams, OrbitPlayer=S.OrbitPlayer, Fling=S.Fling, WalkFling=S.WalkFling, FlyFling=S.FlyFling, Spin=S.Spin}
			for rn, val in pairs(m) do if ToggleRefs[rn] and val ~= nil then ToggleRefs[rn].Set(val) end end; UpdateKeybindPanel()
			FPSFrame.Visible = S.FPSCounter
			CoordsFrame.Visible = S.Coordinates
			UpdateCrosshair()
		end)
		Notify(L("hub_name"), "'" .. n .. "' " .. L("loaded"), 3)
	end)
	Button(p, L("autoload_set"), function() local n = cfgBox.Text; if n == "" then n = "default" end; SetAutoLoad(n); Notify(L("hub_name"), "Auto-load -> '" .. n .. "'", 3) end)
	Button(p, L("delete_config"), function() local n = cfgBox.Text; if n == "" then return end; DeleteConfig(n); cfgBox.Text = ""; configDD.Refresh(GetConfigs()); Notify(L("hub_name"), "'" .. n .. "' " .. L("deleted"), 3) end, true)
	Button(p, L("refresh_configs"), function() configDD.Refresh(GetConfigs()) end)

	Section(p, L("experimental"))
	InfoCard(p, L("blur_hint"))
	Toggle(p, L("blur_background"), S.BlurBackground or false, function(on)
		S.BlurBackground = on
		if on then
			CreateBlur()
		else
			pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)
			BlurEffect = nil
		end
	end, "BlurBackground")

	Section(p, "UI")
	InfoCard(p, "↘ " .. L("resize_hint"))

	Section(p, L("server"))
	Button(p, L("server_hop"), function() pcall(function() local d = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")); for _, sv in pairs(d.data) do if sv.id ~= game.JobId and sv.playing < sv.maxPlayers then TeleportService:TeleportToPlaceInstance(game.PlaceId, sv.id, Player); break end end end) end)
	Button(p, L("rejoin"), function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player) end)

	Section(p, L("info"))
	pcall(function() InfoCard(p, "🎮 Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, true) end)
	InfoCard(p, "📍 PlaceId: " .. game.PlaceId, true)
	InfoCard(p, "🔗 JobId: " .. game.JobId, true)
	InfoCard(p, "👥 Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers, true)

	Section(p, L("sect_danger"))
	Button(p, L("reload_menu"), function()
		Notify(L("hub_name"), L("reloading"), 2)
		SaveConfig("_reload_temp")
		
		local rURL = _G.NesficateHubSource
		local sURL = nil
		pcall(function() 
			if isfile(ConfigDir.."/reload_source.txt") then 
				sURL = readfile(ConfigDir.."/reload_source.txt")
				if sURL == "" then sURL = nil end
			end 
		end)
		
		task.wait(0.3)
		pcall(function() Gui:Destroy() end)
		pcall(function() KBPanelGui:Destroy() end)
		pcall(function() ScreenInfoGui:Destroy() end)
		pcall(function() CrosshairGui:Destroy() end)
		pcall(function() NotificationGui:Destroy() end)
		
		task.wait(0.3)
		local ok = false
		
		if not ok and rURL and rURL ~= "" then 
			ok = pcall(function() 
				loadstring(game:HttpGet(rURL))() 
			end) 
		end
		
		if not ok and sURL then 
			ok = pcall(function() 
				loadstring(game:HttpGet(sURL))() 
			end) 
		end
		
		if not ok then 
			pcall(function() 
				if isfile(ConfigDir.."/script.lua") then 
					ok = pcall(function() 
						loadstring(readfile(ConfigDir.."/script.lua"))() 
					end) 
				end 
			end) 
		end
		
		if not ok then 
			Notify("Neo's Hub", L("reload_fail"), 8) 
		end
	end)
	Button(p, L("panic"), function() PanicUnload() end, true)
end

-- ═══ PAGE: THEMES (with Particles) ═══
do
	local p = tabPages["tab_themes"]

	-- ═══ PARTICLES IN THEMES ═══
	Section(p, L("particles"))
	local pOpts = {L("particles_none"), L("particles_snow"), L("particles_stars"), L("particles_hearts"), L("particles_bubbles"), L("particles_rain")}
	local pMap = {[L("particles_none")] = "None", [L("particles_snow")] = "Snow", [L("particles_stars")] = "Stars", [L("particles_hearts")] = "Hearts", [L("particles_bubbles")] = "Bubbles", [L("particles_rain")] = "Rain"}
	Dropdown(p, L("particles"), pOpts, function(val) local style = pMap[val] or "None"; S.ParticleStyle = style; SpawnParticles(style) end)

	-- ═══ CUSTOM THEMES ═══
	Section(p, L("custom_themes"))
	
	local themePathCard = Create("Frame", {Size = UDim2.new(1, 0, 0, 28), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); themePathCard:SetAttribute("OrigBT", 0); Corner(themePathCard, 10)
	Create("TextLabel", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "📁 Themes path: " .. ConfigDir .. "/Themes/", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = themePathCard}):SetAttribute("OrigTT", 0)
	
	local themeIF = Create("Frame", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); themeIF:SetAttribute("OrigBT", 0); Corner(themeIF, 12)
	local themeBox = Create("TextBox", {Size = UDim2.new(1, -20, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, PlaceholderText = L("theme_name"), PlaceholderColor3 = TC(S.Theme.SubText), Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = themeIF}); themeBox:SetAttribute("OrigTT", 0)
	
	local themeDD = Dropdown(p, L("select_theme"), GetThemes(), function(val) themeBox.Text = val end)
	
	Button(p, L("save_theme"), function()
		local n = themeBox.Text
		if n == "" then n = "MyTheme" end
		SaveTheme(n)
		themeDD.Refresh(GetThemes())
		Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("saved"), 3)
	end)
	
	Button(p, L("load_theme"), function()
		local n = themeBox.Text
		if n == "" then return end
		LoadTheme(n)
		Main.BackgroundColor3 = TC(S.Theme.Bg)
		Sidebar.BackgroundColor3 = TC(S.Theme.Sidebar)
		for _, child in pairs(Sidebar:GetChildren()) do 
			if child:IsA("Frame") then 
				pcall(function() child.BackgroundColor3 = TC(S.Theme.Sidebar) end) 
			end 
		end
		for _, obj in pairs(Main:GetChildren()) do 
			if obj:IsA("UIStroke") then obj.Color = TC(S.Theme.Accent) end 
		end
		UpdateKeybindPanel()
		Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("loaded"), 3)
	end)
	
	Button(p, L("delete_theme"), function()
		local n = themeBox.Text
		if n == "" then return end
		DeleteTheme(n)
		themeBox.Text = ""
		themeDD.Refresh(GetThemes())
		Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("deleted"), 3)
	end, true)

	-- ═══ THEME EDITOR ═══
	Section(p, L("theme_editor"))
	ColorPicker(p, L("accent_color"), S.Theme.Accent, function(c) 
		S.Theme.Accent = c; S.Theme.ToggleOn = c
		for _, obj in pairs(Main:GetChildren()) do if obj:IsA("UIStroke") then obj.Color = TC(c) end end
		UpdateKeybindPanel()
		pcall(function()
			FPSFrame:FindFirstChildOfClass("UIStroke").Color = TC(c)
			CoordsFrame:FindFirstChildOfClass("UIStroke").Color = TC(c)
		end)
	end)
	ColorPicker(p, L("bg_color"), S.Theme.Bg, function(c) S.Theme.Bg = c; Main.BackgroundColor3 = TC(c); FPSFrame.BackgroundColor3 = TC(c); CoordsFrame.BackgroundColor3 = TC(c); KBPanel.BackgroundColor3 = TC(c) end)
	ColorPicker(p, L("sidebar_color"), S.Theme.Sidebar, function(c) S.Theme.Sidebar = c; Sidebar.BackgroundColor3 = TC(c); for _, ch in pairs(Sidebar:GetChildren()) do if ch:IsA("Frame") then pcall(function() ch.BackgroundColor3 = TC(c) end) end end end)
	ColorPicker(p, L("card_color"), S.Theme.Card, function(c) S.Theme.Card = c end)
	ColorPicker(p, L("text_color"), S.Theme.Text, function(c) S.Theme.Text = c end)
	ColorPicker(p, L("subtext_color"), S.Theme.SubText, function(c) S.Theme.SubText = c end)
	ColorPicker(p, L("danger_color"), S.Theme.Danger, function(c) S.Theme.Danger = c end)

	Section(p, L("theme_presets"))
	local themes = {
		{"💜 Default Purple", {111, 90, 255}, {16, 16, 22}, {12, 12, 17}}, 
		{"🌊 Ocean Blue", {50, 150, 255}, {12, 18, 28}, {8, 14, 22}}, 
		{"❤️ Crimson Red", {220, 50, 50}, {24, 14, 14}, {18, 10, 10}}, 
		{"💚 Emerald Green", {50, 205, 100}, {12, 22, 16}, {8, 18, 12}}, 
		{"🌟 Golden Sun", {255, 190, 50}, {24, 22, 12}, {18, 16, 8}}, 
		{"💗 Pink Neon", {255, 80, 180}, {24, 14, 22}, {18, 10, 18}}, 
		{"❄️ Arctic", {180, 200, 255}, {20, 22, 28}, {16, 18, 24}}, 
		{"🌙 Midnight", {100, 100, 180}, {8, 8, 14}, {4, 4, 10}}, 
		{"🌅 Sunset", {255, 120, 50}, {24, 16, 10}, {18, 12, 6}}, 
		{"💎 Cyan Diamond", {0, 220, 220}, {10, 22, 24}, {6, 18, 20}}
	}
	for _, td in ipairs(themes) do
		local name, accent, bg, sb = td[1], td[2], td[3], td[4]
		local tbtn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), Text = "", BorderSizePixel = 0, Parent = p}); tbtn:SetAttribute("OrigBT", 0); Corner(tbtn, 12)
		local cprev = Create("Frame", {Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(0, 12, 0.5, -14), BackgroundColor3 = TC(accent), BorderSizePixel = 0, Parent = tbtn}); cprev:SetAttribute("OrigBT", 0); Corner(cprev, 14); Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0.5, Parent = cprev})
		Create("TextLabel", {Size = UDim2.new(1, -56, 1, 0), Position = UDim2.new(0, 50, 0, 0), BackgroundTransparency = 1, Text = name, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = tbtn}):SetAttribute("OrigTT", 0)
		tbtn.MouseEnter:Connect(function() tween(tbtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
		tbtn.MouseLeave:Connect(function() tween(tbtn, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
		tbtn.MouseButton1Click:Connect(function()
			S.Theme.Accent = accent; S.Theme.ToggleOn = accent; S.Theme.Bg = bg; S.Theme.Sidebar = sb
			Main.BackgroundColor3 = TC(bg); Sidebar.BackgroundColor3 = TC(sb)
			for _, child in pairs(Sidebar:GetChildren()) do if child:IsA("Frame") then pcall(function() child.BackgroundColor3 = TC(sb) end) end end
			for _, obj in pairs(Main:GetChildren()) do if obj:IsA("UIStroke") then obj.Color = TC(accent) end end
			UpdateKeybindPanel()
			FPSFrame.BackgroundColor3 = TC(bg)
			CoordsFrame.BackgroundColor3 = TC(bg)
			KBPanel.BackgroundColor3 = TC(bg)
			pcall(function()
				FPSFrame:FindFirstChildOfClass("UIStroke").Color = TC(accent)
				CoordsFrame:FindFirstChildOfClass("UIStroke").Color = TC(accent)
			end)
			Notify(L("hub_name"), "Theme applied: " .. name, 2)
		end)
	end
end

-- ═══ PAGE: CREDITS ═══
do
	local p = tabPages["tab_credits"]
	local banner = Create("Frame", {Size = UDim2.new(1, 0, 0, 110), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); banner:SetAttribute("OrigBT", 0); Corner(banner, 14)
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, TC(S.Theme.Accent)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(30, 25, 50)), ColorSequenceKeypoint.new(1, TC(S.Theme.Card))}), Rotation = 25, Parent = banner})
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 40), Position = UDim2.new(0, 0, 0, 15), BackgroundTransparency = 1, Text = "✨ Neo's Hub ✨", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBlack, TextSize = 32, Parent = banner}):SetAttribute("OrigTT", 0)
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 55), BackgroundTransparency = 1, Text = L("version"), TextColor3 = Color3.fromRGB(200, 200, 220), Font = Enum.Font.GothamBold, TextSize = 15, Parent = banner}):SetAttribute("OrigTT", 0)
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 0, 80), BackgroundTransparency = 1, Text = L("made_with"), TextColor3 = Color3.fromRGB(160, 160, 180), Font = Enum.Font.GothamSemibold, TextSize = 12, Parent = banner}):SetAttribute("OrigTT", 0)

	Section(p, L("developer"))
	local links = {
		{"💬 Discord", "mrneoner", nil},
		{"📱 Telegram", "@wantpepa", "https://t.me/wantpepa"},
		{"🐙 GitHub", "mrneoner1337", "https://github.com/mrneoner1337"},
		{"🎮 Roblox", "LegoSurgeon", "https://www.roblox.com/users/LegoSurgeon/profile"},
	}
	for _, s2 in ipairs(links) do
		local card = Create("Frame", {Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); card:SetAttribute("OrigBT", 0); Corner(card, 12)
		Create("TextLabel", {Size = UDim2.new(0.4, 0, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = s2[1], TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = card}):SetAttribute("OrigTT", 0)
		local valLbl = Create("TextLabel", {Size = UDim2.new(0.55, -16, 1, 0), Position = UDim2.new(0.45, 0, 0, 0), BackgroundTransparency = 1, Text = s2[2], TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Right, Parent = card}); valLbl:SetAttribute("OrigTT", 0)
		local clickBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = card})
		clickBtn.MouseEnter:Connect(function() tween(card, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
		clickBtn.MouseLeave:Connect(function() tween(card, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
		clickBtn.MouseButton1Click:Connect(function()
			CopyToClipboard(s2[3] or s2[2])
			Notify(L("hub_name"), L("copied") .. " " .. (s2[3] or s2[2]), 3)
		end)
	end

	Section(p, L("changelog"))
	local changelogItems = {
		{"v3.0", "🚀 Major Update", {
			"Complete UI redesign with modern aesthetics",
			"Custom theme save/load system",
			"Full multi-language support (EN/RU/JP/ES)",
			"Draggable FPS counter & coordinates display",
			"Customizable crosshair system",
			"Chams (Surface GUI highlighting)",
			"Orbit player feature",
			"FOV changer & day/night cycle control",
			"Custom skybox support",
			"Beautiful rounded notifications",
			"Advanced color picker with RGB/HEX/presets",
			"Improved keybind system with duplicate detection",
			"Corner drag to resize window",
			"Inline ESP preview in menu",
			"Experimental blur background option",
			"Separated Themes tab",
		}},
		{"v2.5", "✨ Polish Update", {
			"Animated loading screen",
			"Keybind panel with live status",
			"10 theme presets",
			"Performance optimizations",
		}},
		{"v2.0", "🔄 Complete Rewrite", {
			"Full codebase rewrite",
			"Tab-based navigation",
			"Config save/load system",
			"Theme system foundation",
		}},
		{"v1.5", "📦 Feature Expansion", {
			"ESP system added",
			"Stun feature",
			"External script integration",
			"Basic keybinds",
		}},
		{"v1.0", "🎉 Initial Release", {
			"Basic movement features",
			"Simple visual options",
			"Core functionality",
		}},
	}

	
	for _, ver in ipairs(changelogItems) do
		local verFrame = Create("Frame", {Size = UDim2.new(1, 0, 0, 0), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.Y, Parent = p}); verFrame:SetAttribute("OrigBT", 0); Corner(verFrame, 12)
		
		local header = Create("Frame", {Size = UDim2.new(1, 0, 0, 36), BackgroundTransparency = 1, Parent = verFrame})
		Create("TextLabel", {Size = UDim2.new(0, 60, 1, 0), Position = UDim2.new(0, 12, 0, 0), BackgroundTransparency = 1, Text = ver[1], TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBlack, TextSize = 16, TextXAlignment = Enum.TextXAlignment.Left, Parent = header}):SetAttribute("OrigTT", 0)
		Create("TextLabel", {Size = UDim2.new(1, -80, 1, 0), Position = UDim2.new(0, 72, 0, 0), BackgroundTransparency = 1, Text = ver[2], TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = header}):SetAttribute("OrigTT", 0)
		
		local contentFrame = Create("Frame", {Size = UDim2.new(1, -24, 0, 0), Position = UDim2.new(0, 12, 0, 36), BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.Y, Parent = verFrame})
		Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = contentFrame})
		
		for _, item in ipairs(ver[3]) do
			Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, Text = "• " .. item, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, AutomaticSize = Enum.AutomaticSize.Y, Parent = contentFrame}):SetAttribute("OrigTT", 0)
		end
		
		Create("Frame", {Size = UDim2.new(1, 0, 0, 10), BackgroundTransparency = 1, Parent = contentFrame})
	end
	
	Section(p, L("disclaimer"))
	InfoCard(p, "⚠️ " .. L("disc_text1"))
	InfoCard(p, "📚 " .. L("disc_text2"))
end

-- ═══ APPLY AUTOLOAD ═══
task.defer(function()
	local al = GetAutoLoad()
	if al ~= "" then
		local m = {Fly=S.Fly, SpeedOverride=S.Speed, JumpOverride=S.JumpBoost, InfJump=S.InfJump, Noclip=S.Noclip, ESP=S.ESP, Fullbright=S.Fullbright, NoFog=S.NoFog, AntiLag=S.AntiLag, ClickTP=S.ClickTP, AntiAFK=S.AntiAFK, Ragdoll=S.Ragdoll, FPSCounter=S.FPSCounter, Coordinates=S.Coordinates, Crosshair=S.Crosshair, Chams=S.Chams, OrbitPlayer=S.OrbitPlayer, Fling=S.Fling, WalkFling=S.WalkFling, FlyFling=S.FlyFling, Spin=S.Spin}
		for rn, val in pairs(m) do if ToggleRefs[rn] and val then ToggleRefs[rn].Set(val) end end; UpdateKeybindPanel()
		FPSFrame.Visible = S.FPSCounter
		CoordsFrame.Visible = S.Coordinates
		UpdateCrosshair()
		if S.OrbitPlayer then StartOrbit() end
		if S.Spin then StartSpin() end
	end
end)

-- ═══ TOGGLE VISIBILITY + KEYBINDS ═══
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	local keyName = input.KeyCode.Name
	local toggleKey = S.Keybinds.ToggleMenu or "RightControl"

	if keyName == toggleKey or (toggleKey == "RightControl" and input.KeyCode == Enum.KeyCode.RightControl) or input.KeyCode == Enum.KeyCode.Insert then
		guiVis = not guiVis
		if guiVis then
			Main.Visible = true
			if minimized then
				tween(Main, {Size = minSize}, 0.4, Enum.EasingStyle.Back)
			else
				tween(Main, {Size = UDim2.new(0, currentWidth, 0, currentHeight)}, 0.4, Enum.EasingStyle.Back)
			end
		else
			tween(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
			task.delay(0.35, function() Main.Visible = false end)
		end
		return
	end
	for _, kb in ipairs(KeybindRegistry) do if kb.key and kb.key ~= "None" and keyName == kb.key then pcall(kb.callback); return end end
end)

-- Apply FOV and Max Zoom on load
task.defer(function()
	pcall(function()
		workspace.CurrentCamera.FieldOfView = S.FOV or 70
		Player.CameraMaxZoomDistance = S.MaxZoom or 128
	end)
end)

task.wait(0.5)
SwitchTab("tab_movement")
Notify("Neo's Hub v3.0", string.format(L("toggle_hint"), S.Keybinds.ToggleMenu or "RightControl") .. "\n" .. L("right_click_hint"), 6)

print("======================================")
print(" Neo's Hub v3.0 — Loaded!")
print(" @mrneoner | Discord: mrneoner")
print(" Telegram: wantpepa")
print(" GitHub: mrneoner1337")
print(" Roblox: LegoSurgeon")
print("======================================")
