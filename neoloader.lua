--[[
══════════════════════════════════════════════════════════════════
Neo's Hub v3.0 — Universal Roblox Menu
Author: @mrneoner
Discord: mrneoner | Telegram: wantpepa
GitHub: mrneoner1337 | Roblox: LegoSurgeon
══════════════════════════════════════════════════════════════════
]]--

-- ═══ STATUS VARIABLE ═══
-- "work" = Working (rainbow), "rewrite" = On Rewriting (red gradient), "unstable" = Unstable (yellow gradient)
local HUB_STATUS = "work"

-- ═══ УСТАНОВКА ИСТОЧНИКА ДЛЯ RELOAD ═══
if not _G.NesficateHubSource then
	_G.NesficateHubSource = "https://raw.githubusercontent.com/mrneoner1337/Neo-Hub-Loader/main/neoloader.lua"
end

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

-- ═══ FLY/FLING GLOBAL VARIABLES ═══
local FLYING = false
local QEfly = true
local iyflyspeed = 1
local flinging = false
local walkflinging = false
local flingDied = nil
local flyKeyDown = nil
local flyKeyUp = nil

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
		tab_movement = "🏃 Movement",
		tab_visual = "👁️ Visual",
		tab_misc = "⚙️ Misc",
		tab_settings = "🔧 Settings",
		tab_themes = "🎨 Themes",
		tab_credits = "💫 Credits",
		fly = "Fly",
		fly_speed = "Fly Speed",
		fly_mode = "Fly Mode",
		fly_mode_default = "Default",
		fly_mode_swim = "Swim Fly",
		fly_mode_noclip = "Noclip Fly",
		fly_mode_platform = "Platform Fly",
		fly_mode_smooth = "Smooth Fly",
		speed_override = "Speed Override",
		walkspeed = "WalkSpeed",
		speed_loop = "Speed Loop (Keep after death)",
		jump_override = "Jump Override",
		jumppower = "JumpPower",
		jump_loop = "Jump Loop (Keep after death)",
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
		esp_preview = "ESP Preview",
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
		btools_delete = "BTools — Hammer (Delete)",
		btools_copy = "BTools — Clone",
		btools_move = "BTools — Move (Grab)",
		btools_all = "BTools — Give All",
		tp_tool = "TP Tool",
		tp_to_player = "Teleport to Player",
		select_player = "Select Player",
		teleport = "Teleport",
		config_name = "Config name...",
		save_config = "Save Config",
		load_config = "Load Config",
		delete_config = "Delete Config",
		create_config = "Create Config",
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
		disclaimer = "Disclaimer",
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
		created = "created!",
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
		particles_settings = "Particle Settings",
		particles_size = "Particle Size",
		particles_amount = "Particle Amount",
		particles_color = "Particle Color",
		show_keybind_panel = "Show Keybind Panel",
		keybind_panel = "Keybind Panel",
		set_keybind = "Set Keybind",
		right_click_hint = "Right-click any toggle/button to set keybind",
		no_keybinds = "No keybinds set",
		on = "ON",
		off = "OFF",
		reloading = "Reloading...",
		reload_fail = "Reload failed.",
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
		sect_orbit = "Orbit",
		experimental = "Experimental",
		blur_background = "Blur Background",
		blur_size = "Blur Size",
		blur_hint = "Blur effect for menu background",
		custom_themes = "Custom Themes",
		save_theme = "Save Theme",
		load_theme = "Load Theme",
		delete_theme = "Delete Theme",
		theme_name = "Theme name...",
		select_theme = "Select Theme",
		resize_hint = "Drag corner to resize",
		fps_unlocker = "FPS Unlocker",
		fps_cap = "FPS Cap",
		fps_unlimited = "Unlimited FPS",
		max_zoom = "Max Camera Zoom",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Fling Power",
		fling_mode = "Fling Mode",
		fling_mode_walk = "Walk Fling",
		fling_mode_fly = "Fly Fling",
		fling_mode_spin = "Spin Fling",
		spin = "Spin",
		spin_speed = "Spin Speed",
		notification_style = "Notification Style",
		notif_style_modern = "Modern",
		notif_style_minimal = "Minimal",
		notif_style_classic = "Classic",
		notif_style_gradient = "Gradient",
		notif_style_neon = "Neon",
		notif_style_glass = "Glass",
		notif_style_cyber = "Cyber",
		apply = "Apply",
		cancel = "Cancel",
		welcome_title = "Welcome to Neo's Hub!",
		welcome_player = "Player Info",
		welcome_game = "Game Info",
		welcome_continue = "Continue",
		performance = "Performance",
		unlock_3rd_person = "Unlock 3rd Person Look",
		config_exists = "Config with this name already exists!",
		profile_info = "Profile Info",
		account_age = "Account Age",
		place_name = "Current Place",
		player_id = "Player ID",
		days = "days",
		test_notification = "Test Notification",
		teleported_to = "Teleported to",
		theme_applied = "Theme applied",
		all_btools_given = "All BTools given!",
		delete_tool_given = "Delete tool given!",
		clone_tool_given = "Clone tool given!",
		move_tool_given = "Move tool given!",
		tp_tool_given = "TP Tool given!",
		enter_config_name = "Enter config name!",
		select_or_enter_config = "Select or enter config name!",
		autoload_set_to = "Auto-load set to",
		language_changed = "Language changed to",
		reload_to_apply = "Reload to fully apply",
		style_changed = "Style changed to",
		keybinds_cleared = "All keybinds cleared!",
		fps_unlocked = "FPS Unlimited!",
		fps_unlocker_not_supported = "FPS Unlocker not supported",
		noclip_enabled_auto = "Noclip enabled automatically",
		fling_enabled = "Fling enabled",
		fly_enabled = "Fly enabled",
		sect_fun = "Fun",
		fun_animation = "Jerk Off",
		fun_animation_desc = "xd",
		rig_r6 = "R6 Rig detected",
		rig_r15 = "R15 Rig detected",
		sit = "Sit",
		jump_scare = "Jump Scare",
		stare_at = "Stare At Player",
		creepy_follow = "Creepy Follow",
		dizzy = "Dizzy Spin",
		bunny_hop = "Bunny Hop",
		crab_walk = "Crab Walk",
		moonwalk = "Moonwalk",
		earthquake = "Earthquake Screen",
		flip = "Flip Character",
		random_tp = "Random Teleport",
		drunk = "Drunk Walk"
	},
	RU = {
		hub_name = "Neo's Hub",
		version = "v3.0 — Универсальное меню",
		loading = "Загрузка...",
		loading_init = "Инициализация модулей...",
		loading_gui = "Построение интерфейса...",
		loading_hooks = "Настройка хуков...",
		loading_done = "Готово!",
		loading_welcome = "Добро пожаловать, пользователь!",
		tab_movement = "🏃 Движение",
		tab_visual = "👁️ Визуал",
		tab_misc = "⚙️ Разное",
		tab_settings = "🔧 Настройки",
		tab_themes = "🎨 Темы",
		tab_credits = "💫 Авторы",
		fly = "Полёт",
		fly_speed = "Скорость полёта",
		fly_mode = "Режим полёта",
		fly_mode_default = "Обычный",
		fly_mode_swim = "Плавание",
		fly_mode_noclip = "С ноклипом",
		fly_mode_platform = "Платформенный",
		fly_mode_smooth = "Плавный полёт",
		speed_override = "Изменить скорость",
		walkspeed = "Скорость ходьбы",
		speed_loop = "Сохранение скорости (После смерти)",
		jump_override = "Изменить прыжок",
		jumppower = "Сила прыжка",
		jump_loop = "Сохранение силы прыжка (После смерти)",
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
		esp_preview = "Предпросмотр ESP",
		fullbright = "Полная яркость",
		no_fog = "Убрать туман",
		anti_lag = "Оптимизация",
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
		btools_delete = "BTools — Удаление",
		btools_copy = "BTools — Клонирование",
		btools_move = "BTools — Перемещение",
		btools_all = "BTools — Выдать все",
		tp_tool = "TP Tool",
		tp_to_player = "Телепорт к игроку",
		select_player = "Выбрать игрока",
		teleport = "Телепортироваться",
		config_name = "Имя конфига...",
		save_config = "Сохранить конфиг",
		load_config = "Загрузить конфиг",
		delete_config = "Удалить конфиг",
		create_config = "Создать конфиг",
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
		created = "создан!",
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
		particles_settings = "Настройки частиц",
		particles_size = "Размер частиц",
		particles_amount = "Количество частиц",
		particles_color = "Цвет частиц",
		show_keybind_panel = "Показать панель клавиш",
		keybind_panel = "Панель клавиш",
		set_keybind = "Задать клавишу",
		right_click_hint = "ПКМ по переключателю/кнопке для назначения клавиши",
		no_keybinds = "Клавиши не заданы",
		on = "ВКЛ",
		off = "ВЫКЛ",
		reloading = "Перезагрузка...",
		reload_fail = "Перезагрузка не удалась.",
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
		sect_orbit = "Орбита",
		experimental = "Экспериментальное",
		blur_background = "Размытие фона",
		blur_size = "Сила размытия",
		blur_hint = "Эффект размытия для фона меню",
		custom_themes = "Кастомные темы",
		save_theme = "Сохранить тему",
		load_theme = "Загрузить тему",
		delete_theme = "Удалить тему",
		theme_name = "Имя темы...",
		select_theme = "Выбрать тему",
		resize_hint = "Тяните за угол для изменения размера",
		fps_unlocker = "Разблокировка FPS",
		fps_cap = "Лимит FPS",
		fps_unlimited = "Безлимитный FPS",
		max_zoom = "Макс. зум камеры",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Сила Fling",
		fling_mode = "Режим Fling",
		fling_mode_walk = "Walk Fling",
		fling_mode_fly = "Fly Fling",
		fling_mode_spin = "Spin Fling",
		spin = "Кручение",
		spin_speed = "Скорость кручения",
		notification_style = "Стиль уведомлений",
		notif_style_modern = "Современный",
		notif_style_minimal = "Минимальный",
		notif_style_classic = "Классический",
		notif_style_gradient = "Градиент",
		notif_style_neon = "Неон",
		notif_style_glass = "Стекло",
		notif_style_cyber = "Кибер",
		apply = "Применить",
		cancel = "Отмена",
		welcome_title = "Добро пожаловать в Neo's Hub!",
		welcome_player = "Информация об игроке",
		welcome_game = "Информация об игре",
		welcome_continue = "Продолжить",
		performance = "Производительность",
		unlock_3rd_person = "Разблокировать вид от 3го лица",
		config_exists = "Конфиг с таким именем уже существует!",
		profile_info = "Информация профиля",
		account_age = "Возраст аккаунта",
		place_name = "Текущий плейс",
		player_id = "ID игрока",
		days = "дней",
		test_notification = "Тестовое уведомление",
		teleported_to = "Телепортирован к",
		theme_applied = "Тема применена",
		all_btools_given = "Все BTools выданы!",
		delete_tool_given = "Инструмент удаления выдан!",
		clone_tool_given = "Инструмент клонирования выдан!",
		move_tool_given = "Инструмент перемещения выдан!",
		tp_tool_given = "TP Tool выдан!",
		enter_config_name = "Введите имя конфига!",
		select_or_enter_config = "Выберите или введите имя конфига!",
		autoload_set_to = "Авто-загрузка установлена на",
		language_changed = "Язык изменён на",
		reload_to_apply = "Перезагрузите для полного применения",
		style_changed = "Стиль изменён на",
		keybinds_cleared = "Все клавиши сброшены!",
		fps_unlocked = "FPS разблокирован!",
		fps_unlocker_not_supported = "FPS Unlocker не поддерживается",
		noclip_enabled_auto = "Ноклип включён автоматически",
		fling_enabled = "Fling включён",
		fly_enabled = "Полёт включён",
		sect_fun = "Развлечения",
		fun_animation = "Дрочка",
		fun_animation_desc = "хд",
		rig_r6 = "Обнаружен R6",
		rig_r15 = "Обнаружен R15",
		drunk = "Пьяная походка",
		sit = "Сесть",
		jump_scare = "Напугать",
		stare_at = "Смотреть на игрока",
		creepy_follow = "Преследование",
		dizzy = "Головокружение",
		bunny_hop = "Авто-прыжок",
		crab_walk = "Крутилка",
		moonwalk = "Лунная походка",
		earthquake = "Тряска экрана ",
		flip = "Перевернуться",
		random_tp = "Рандом телепорт"
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
		tab_movement = "🏃 移動",
		tab_visual = "👁️ ビジュアル",
		tab_misc = "⚙️ その他",
		tab_settings = "🔧 設定",
		tab_themes = "🎨 テーマ",
		tab_credits = "💫 クレジット",
		fly = "フライ",
		fly_speed = "フライ速度",
		fly_mode = "フライモード",
		fly_mode_default = "デフォルト",
		fly_mode_swim = "スイムフライ",
		fly_mode_noclip = "ノークリップフライ",
		fly_mode_platform = "プラットフォーム",
		fly_mode_smooth = "スムーズフライ",
		speed_override = "速度変更",
		walkspeed = "歩行速度",
		speed_loop = "速度ループ (死後維持)",
		jump_override = "ジャンプ変更",
		jumppower = "ジャンプ力",
		jump_loop = "ジャンプループ (死後維持)",
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
		esp_preview = "ESPプレビュー",
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
		btools_delete = "BTools — ハンマー（削除）",
		btools_copy = "BTools — クローン",
		btools_move = "BTools — 移動",
		btools_all = "BTools — 全て付与",
		tp_tool = "TPツール",
		tp_to_player = "プレイヤーへTP",
		select_player = "プレイヤー選択",
		teleport = "テレポート",
		config_name = "設定名...",
		save_config = "設定を保存",
		load_config = "設定を読込",
		delete_config = "設定を削除",
		create_config = "設定を作成",
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
		created = "作成しました！",
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
		particles_settings = "パーティクル設定",
		particles_size = "パーティクルサイズ",
		particles_amount = "パーティクル量",
		particles_color = "パーティクル色",
		show_keybind_panel = "キーバインドパネル表示",
		keybind_panel = "キーバインドパネル",
		set_keybind = "キー設定",
		right_click_hint = "右クリックでキーバインド設定",
		no_keybinds = "キーバインド未設定",
		on = "ON",
		off = "OFF",
		reloading = "再読込中...",
		reload_fail = "再読込失敗。",
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
		sect_orbit = "オービット",
		experimental = "実験的",
		blur_background = "背景ブラー",
		blur_size = "ブラーサイズ",
		blur_hint = "メニュー背景のブラー効果",
		custom_themes = "カスタムテーマ",
		save_theme = "テーマ保存",
		load_theme = "テーマ読込",
		delete_theme = "テーマ削除",
		theme_name = "テーマ名...",
		select_theme = "テーマ選択",
		resize_hint = "角をドラッグしてリサイズ",
		fps_unlocker = "FPSアンロッカー",
		fps_cap = "FPS上限",
		fps_unlimited = "無制限FPS",
		max_zoom = "最大カメラズーム",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Fling力",
		fling_mode = "Flingモード",
		fling_mode_walk = "Walk Fling",
		fling_mode_fly = "Fly Fling",
		fling_mode_spin = "Spin Fling",
		spin = "Spin",
		spin_speed = "Spin速度",
		notification_style = "通知スタイル",
		notif_style_modern = "モダン",
		notif_style_minimal = "ミニマル",
		notif_style_classic = "クラシック",
		notif_style_gradient = "グラデーション",
		notif_style_neon = "ネオン",
		notif_style_glass = "ガラス",
		notif_style_cyber = "サイバー",
		apply = "適用",
		cancel = "キャンセル",
		welcome_title = "Neo's Hubへようこそ！",
		welcome_player = "プレイヤー情報",
		welcome_game = "ゲーム情報",
		welcome_continue = "続ける",
		performance = "パフォーマンス",
		unlock_3rd_person = "3rdパーソンロック解除",
		config_exists = "同名の設定が既に存在します！",
		profile_info = "プロフィール情報",
		account_age = "アカウント年齢",
		place_name = "現在のプレイス",
		player_id = "プレイヤーID",
		days = "日",
		test_notification = "テスト通知",
		teleported_to = "テレポート先",
		theme_applied = "テーマ適用",
		all_btools_given = "全BTools付与！",
		delete_tool_given = "削除ツール付与！",
		clone_tool_given = "クローンツール付与！",
		move_tool_given = "移動ツール付与！",
		tp_tool_given = "TPツール付与！",
		enter_config_name = "設定名を入力！",
		select_or_enter_config = "設定名を選択または入力！",
		autoload_set_to = "自動読込設定",
		language_changed = "言語変更",
		reload_to_apply = "完全適用には再読込",
		style_changed = "スタイル変更",
		keybinds_cleared = "全キーバインド消去！",
		fps_unlocked = "FPS無制限！",
		fps_unlocker_not_supported = "FPSアンロッカー非対応",
		noclip_enabled_auto = "ノークリップ自動有効化",
		fling_enabled = "Fling有効化",
		fly_enabled = "フライ有効化",
		sect_fun = "楽しい",
		fun_animation = "楽しいアニメーション",
		fun_animation_desc = "ダンス、エモート、アニメーション",
		rig_r6 = "R6リグ検出",
		rig_r15 = "R15リグ検出",
		drunk = "酔っぱらい歩き",
		sit = "座る",
		jump_scare = "ジャンプスケア",
		stare_at = "プレイヤーを見つめる",
		creepy_follow = "不気味な追跡",
		dizzy = "めまいスピン",
		bunny_hop = "バニーホップ",
		crab_walk = "カニ歩き",
		moonwalk = "ムーンウォーク",
		earthquake = "画面揺れ",
		flip = "キャラ反転",
		random_tp = "ランダムテレポート"
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
		tab_movement = "🏃 Movimiento",
		tab_visual = "👁️ Visual",
		tab_misc = "⚙️ Varios",
		tab_settings = "🔧 Ajustes",
		tab_themes = "🎨 Temas",
		tab_credits = "💫 Créditos",
		fly = "Volar",
		fly_speed = "Velocidad de vuelo",
		fly_mode = "Modo de vuelo",
		fly_mode_default = "Por defecto",
		fly_mode_swim = "Nadar volando",
		fly_mode_noclip = "Noclip vuelo",
		fly_mode_platform = "Plataforma",
		fly_mode_smooth = "Vuelo suave",
		speed_override = "Cambiar velocidad",
		walkspeed = "Vel. de caminar",
		speed_loop = "Loop velocidad (Mantener tras muerte)",
		jump_override = "Cambiar salto",
		jumppower = "Fuerza de salto",
		jump_loop = "Loop salto (Mantener tras muerte)",
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
		esp_preview = "Vista previa ESP",
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
		btools_delete = "BTools — Martillo (Eliminar)",
		btools_copy = "BTools — Clonar",
		btools_move = "BTools — Mover",
		btools_all = "BTools — Dar todos",
		tp_tool = "Herramienta TP",
		tp_to_player = "Teleportar a jugador",
		select_player = "Seleccionar jugador",
		teleport = "Teleportar",
		config_name = "Nombre del config...",
		save_config = "Guardar config",
		load_config = "Cargar config",
		delete_config = "Eliminar config",
		create_config = "Crear config",
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
		created = "creado!",
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
		particles_settings = "Ajustes de partículas",
		particles_size = "Tamaño de partículas",
		particles_amount = "Cantidad de partículas",
		particles_color = "Color de partículas",
		show_keybind_panel = "Mostrar panel de atajos",
		keybind_panel = "Panel de atajos",
		set_keybind = "Asignar tecla",
		right_click_hint = "Clic derecho para asignar tecla",
		no_keybinds = "Sin atajos asignados",
		on = "ON",
		off = "OFF",
		reloading = "Recargando...",
		reload_fail = "Recarga fallida.",
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
		sect_orbit = "Órbita",
		experimental = "Experimental",
		blur_background = "Fondo borroso",
		blur_size = "Tamaño del blur",
		blur_hint = "Efecto blur para el fondo del menú",
		custom_themes = "Temas personalizados",
		save_theme = "Guardar tema",
		load_theme = "Cargar tema",
		delete_theme = "Eliminar tema",
		theme_name = "Nombre del tema...",
		select_theme = "Seleccionar tema",
		resize_hint = "Arrastre la esquina para redimensionar",
		fps_unlocker = "Desbloqueo de FPS",
		fps_cap = "Límite FPS",
		fps_unlimited = "FPS Ilimitado",
		max_zoom = "Zoom máximo de cámara",
		sect_fling = "Fling & Spin",
		fling = "Fling",
		fling_power = "Poder de Fling",
		fling_mode = "Modo de Fling",
		fling_mode_walk = "Walk Fling",
		fling_mode_fly = "Fly Fling",
		fling_mode_spin = "Spin Fling",
		spin = "Spin",
		spin_speed = "Velocidad de Spin",
		notification_style = "Estilo de notificación",
		notif_style_modern = "Moderno",
		notif_style_minimal = "Mínimo",
		notif_style_classic = "Clásico",
		notif_style_gradient = "Gradiente",
		notif_style_neon = "Neón",
		notif_style_glass = "Vidrio",
		notif_style_cyber = "Ciber",
		apply = "Aplicar",
		cancel = "Cancelar",
		welcome_title = "¡Bienvenido a Neo's Hub!",
		welcome_player = "Info del jugador",
		welcome_game = "Info del juego",
		welcome_continue = "Continuar",
		performance = "Rendimiento",
		unlock_3rd_person = "Desbloquear 3ra persona",
		config_exists = "¡Ya existe un config con ese nombre!",
		profile_info = "Info del perfil",
		account_age = "Edad de cuenta",
		place_name = "Lugar actual",
		player_id = "ID de jugador",
		days = "días",
		test_notification = "Notificación de prueba",
		teleported_to = "Teleportado a",
		theme_applied = "Tema aplicado",
		all_btools_given = "¡Todos los BTools dados!",
		delete_tool_given = "¡Herramienta eliminar dada!",
		clone_tool_given = "¡Herramienta clonar dada!",
		move_tool_given = "¡Herramienta mover dada!",
		tp_tool_given = "¡TP Tool dado!",
		enter_config_name = "¡Ingrese nombre de config!",
		select_or_enter_config = "¡Seleccione o ingrese nombre de config!",
		autoload_set_to = "Auto-carga establecida a",
		language_changed = "Idioma cambiado a",
		reload_to_apply = "Recargue para aplicar completamente",
		style_changed = "Estilo cambiado a",
		keybinds_cleared = "¡Todos los atajos borrados!",
		fps_unlocked = "¡FPS Ilimitado!",
		fps_unlocker_not_supported = "FPS Unlocker no soportado",
		noclip_enabled_auto = "Noclip activado automáticamente",
		fling_enabled = "Fling activado",
		fly_enabled = "Vuelo activado",
		sect_fun = "Diversión",
		fun_animation = "Animación Divertida",
		fun_animation_desc = "Bailes, emotes y animaciones",
		rig_r6 = "R6 detectado",
		rig_r15 = "R15 detectado",
		drunk = "Caminar Borracho",
		sit = "Sentarse",
		jump_scare = "Susto",
		stare_at = "Mirar a Jugador",
		creepy_follow = "Seguimiento Espeluznante",
		dizzy = "Giro Mareado",
		bunny_hop = "Salto de Conejo",
		crab_walk = "Caminar de Cangrejo",
		moonwalk = "Moonwalk",
		earthquake = "Terremoto de Pantalla",
		flip = "Voltear Personaje",
		random_tp = "Teleporte Aleatorio"
	},
}

local CurrentLang = "EN"
local function L(key)
	return Langs[CurrentLang][key] or Langs.EN[key] or key
end

-- ═══ DEFAULT THEME VALUES (for reset) ═══
local DEFAULT_THEME = {
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
}

-- ═══ SETTINGS (EXPANDED) ═══
local S = {
	-- Movement
	Fly = false, FlySpeed = 50, FlyMode = "Default",
	Speed = false, WalkSpeed = 16, SpeedLoop = false,
	JumpBoost = false, JumpPower = 50, JumpLoop = false,
	InfJump = false, Noclip = false,
	-- Fling & Spin
	Fling = false, FlingPower = 500, FlingMode = "Walk",
	Spin = false, SpinSpeed = 20,
	-- ESP
	ESP = false, ESPColor = {255, 0, 0}, ESPOutline = {255, 255, 255},
	ESPFillTransparency = 0.5, ESPDistance = 1000,
	ESPShowName = true, ESPShowHealth = true, ESPTeamCheck = false,
	ESPTracers = false, ESPRainbow = false, ESPBoxes = false,
	-- Visual
	Fullbright = false, NoFog = false, AntiLag = false, ClickTP = false, AntiAFK = true,
	Ragdoll = false,
	Chams = false, ChamsColor = {255, 0, 0},
	Crosshair = false, CrosshairColor = {255, 255, 255},
	CrosshairSize = 10, CrosshairThickness = 2,
	FOV = 70, MaxZoom = 128,
	DayNightTime = 14, CustomSkybox = "",
	Unlock3rdPerson = false,
	-- Screen Info
	FPSCounter = false, FPSColor = {255, 255, 255},
	Coordinates = false, CoordsColor = {255, 255, 255},
	-- Orbit
	OrbitPlayer = false, OrbitSpeed = 1, OrbitDistance = 15, OrbitTarget = "",
	-- System
	Language = "EN",
	AutoLoadConfig = "",
	-- Particles
	ParticlesEnabled = false,
	ParticleSize = 12,
	ParticleAmount = 20,
	-- Blur
	BlurBackground = false,
	BlurSize = 24,
	-- UI
	ShowKeybindPanel = false,
	NotificationStyle = "Modern",
	-- FPS
	FPSCap = 60,
	-- Theme
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

local function DeepCopy(orig)
	local copy
	if type(orig) == 'table' then
		copy = {}
		for k, v in pairs(orig) do
			copy[k] = DeepCopy(v)
		end
	else
		copy = orig
	end
	return copy
end

local function ConfigExists(name)
	local exists = false
	pcall(function()
		exists = isfile(ConfigDir.."/Configs/"..name..".json")
	end)
	return exists
end

local function SaveConfig(name)
	pcall(function()
		local saveData = DeepCopy(S)
		writefile(ConfigDir.."/Configs/"..name..".json", HttpService:JSONEncode(saveData))
	end)
end

local function LoadConfig(name)
	pcall(function()
		if isfile(ConfigDir.."/Configs/"..name..".json") then
			local d = HttpService:JSONDecode(readfile(ConfigDir.."/Configs/"..name..".json"))
			for k,v in pairs(d) do
				if type(v) == "table" and type(S[k]) == "table" then
					for k2, v2 in pairs(v) do
						S[k][k2] = v2
					end
				else
					S[k] = v
				end
			end
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
			if n and n ~= "_reload_temp" then
				table.insert(r, n)
			end
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

local function SaveTheme(name)
	pcall(function()
		local themeData = DeepCopy(S.Theme)
		themeData.ParticlesEnabled = S.ParticlesEnabled
		themeData.ParticleSize = S.ParticleSize
		themeData.ParticleAmount = S.ParticleAmount
		writefile(ConfigDir.."/Themes/"..name..".json", HttpService:JSONEncode(themeData))
	end)
end

local function LoadTheme(name)
	pcall(function()
		if isfile(ConfigDir.."/Themes/"..name..".json") then
			local d = HttpService:JSONDecode(readfile(ConfigDir.."/Themes/"..name..".json"))
			for k,v in pairs(d) do
				if S.Theme[k] ~= nil then
					S.Theme[k] = v
				elseif S[k] ~= nil then
					S[k] = v
				end
			end
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

local function SaveCurrentTheme()
	pcall(function()
		writefile(ConfigDir.."/current_theme.json", HttpService:JSONEncode({
			Theme = S.Theme,
			ParticlesEnabled = S.ParticlesEnabled,
			ParticleSize = S.ParticleSize,
			ParticleAmount = S.ParticleAmount,
			BlurBackground = S.BlurBackground,
			BlurSize = S.BlurSize,
			NotificationStyle = S.NotificationStyle,
		}))
	end)
end

local function LoadCurrentTheme()
	pcall(function()
		if isfile(ConfigDir.."/current_theme.json") then
			local d = HttpService:JSONDecode(readfile(ConfigDir.."/current_theme.json"))
			if d.Theme then
				for k,v in pairs(d.Theme) do S.Theme[k] = v end
			end
			if d.ParticlesEnabled ~= nil then S.ParticlesEnabled = d.ParticlesEnabled end
			if d.ParticleSize then S.ParticleSize = d.ParticleSize end
			if d.ParticleAmount then S.ParticleAmount = d.ParticleAmount end
			if d.BlurBackground ~= nil then S.BlurBackground = d.BlurBackground end
			if d.BlurSize then S.BlurSize = d.BlurSize end
			if d.NotificationStyle then S.NotificationStyle = d.NotificationStyle end
		end
	end)
end

-- Load saved data
CurrentLang = LoadLanguage()
S.Language = CurrentLang
LoadCurrentTheme()

do
	local al = GetAutoLoad()
	if al ~= "" and al ~= "_reload_temp" then LoadConfig(al) end
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
pcall(function() CoreGui:FindFirstChild("NHWelcome"):Destroy() end)
pcall(function() CoreGui:FindFirstChild("NHProfilePopup"):Destroy() end)
pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)

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
	return Create("UIPadding", {PaddingTop=UDim.new(0,t), PaddingBottom=UDim.new(0,b), PaddingLeft=UDim.new(0,l), PaddingRight=UDim.new(0,r), Parent=p})
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
local guiVis = true
local isToggling = false

-- ═══ PANIC FUNCTION ═══
local function PanicUnload()
	SaveCurrentTheme()
	pcall(function()
		S.Fly = false; S.Speed = false; S.JumpBoost = false
		S.InfJump = false; S.Noclip = false; S.ESP = false
		S.Fullbright = false; S.NoFog = false; S.ClickTP = false
		S.AntiLag = false; S.Ragdoll = false; S.OrbitPlayer = false
		S.Chams = false; S.Crosshair = false; S.FPSCounter = false; S.Coordinates = false
		S.Fling = false; S.Spin = false
		FLYING = false
		flinging = false
		walkflinging = false
		local root = getRoot()
		pcall(function() root:FindFirstChild("NHFly"):Destroy() end)
		pcall(function() root:FindFirstChild("NHGyro"):Destroy() end)
		pcall(function() root:FindFirstChild("NHSpin"):Destroy() end)
		pcall(function() root:FindFirstChild("NHPlatform"):Destroy() end)
		pcall(function() root:FindFirstChild("NHFling"):Destroy() end)
		pcall(function() root:FindFirstChild("BodyGyro"):Destroy() end)
		pcall(function() root:FindFirstChild("BodyVelocity"):Destroy() end)
		pcall(function() root:FindFirstChild("BodyAngularVelocity"):Destroy() end)
		getHum().WalkSpeed = 16; getHum().JumpPower = 50
		getHum().PlatformStand = false
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
	pcall(function() CoreGui:FindFirstChild("NHWelcome"):Destroy() end)
	pcall(function() CoreGui:FindFirstChild("NHProfilePopup"):Destroy() end)
	pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)
end

local function CopyToClipboard(text)
	pcall(function()
		if setclipboard then setclipboard(text) elseif toclipboard then toclipboard(text) end
	end)
end
-- ═══ BLUR BACKGROUND SYSTEM ═══
local BlurEffect = nil

local function CreateBlur()
	pcall(function() Lighting:FindFirstChild("NHBlur"):Destroy() end)
	BlurEffect = Instance.new("BlurEffect")
	BlurEffect.Name = "NHBlur"
	BlurEffect.Size = 0
	BlurEffect.Parent = Lighting
end

local function UpdateBlurState()
	if BlurEffect then
		if S.BlurBackground and guiVis then
			BlurEffect.Size = S.BlurSize or 24
		else
			BlurEffect.Size = 0
		end
	end
end

local function ShowBlurImmediate()
	if BlurEffect and S.BlurBackground then
		BlurEffect.Size = S.BlurSize or 24
	end
end

local function HideBlurImmediate()
	if BlurEffect then
		BlurEffect.Size = 0
	end
end

CreateBlur()
-- ═══ NOTIFICATION SYSTEM (SYNCED WITH THEME) ═══
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

local function NotifyModern(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Bg),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 16)
	
	local stroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = notif})
	local inner = Create("Frame", {Size = UDim2.new(1, -16, 1, -16), Position = UDim2.new(0, 8, 0, 8), BackgroundTransparency = 1, Parent = notif})
	
	local accentCircle = Create("Frame", {Size = UDim2.new(0, 44, 0, 44), Position = UDim2.new(0, 0, 0, 8), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.1, BorderSizePixel = 0, Parent = inner})
	Corner(accentCircle, 22)
	Create("TextLabel", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "N", TextSize = 20, Font = Enum.Font.GothamBold, TextColor3 = Color3.new(1, 1, 1), Parent = accentCircle})
	
	Create("TextLabel", {Size = UDim2.new(1, -60, 0, 22), Position = UDim2.new(0, 54, 0, 6), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBlack, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Parent = inner})
	Create("TextLabel", {Size = UDim2.new(1, -60, 0, 36), Position = UDim2.new(0, 54, 0, 28), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Parent = inner})
	
	local progressBg = Create("Frame", {Size = UDim2.new(1, 0, 0, 4), Position = UDim2.new(0, 0, 1, -12), BackgroundColor3 = TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = inner})
	Corner(progressBg, 2)
	local progressFill = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = progressBg})
	Corner(progressFill, 2)
	
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

local function NotifyMinimal(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Card),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 8)
	
	local accentBar = Create("Frame", {Size = UDim2.new(0, 4, 1, -8), Position = UDim2.new(0, 4, 0, 4), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = notif})
	Corner(accentBar, 2)
	
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 18), Position = UDim2.new(0, 16, 0, 8), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 28), Position = UDim2.new(0, 16, 0, 26), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif})
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 60)}, 0.3, Enum.EasingStyle.Quint)
	
	task.delay(duration or 4, function()
		tween(notif, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.3)
		task.delay(0.35, function() pcall(function() notif:Destroy() end) end)
	end)
end

local function NotifyClassic(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Bg),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 6)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Parent = notif})
	
	Create("TextLabel", {Size = UDim2.new(1, -16, 0, 20), Position = UDim2.new(0, 8, 0, 6), BackgroundTransparency = 1, Text = "[ " .. title .. " ]", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.Code, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	Create("TextLabel", {Size = UDim2.new(1, -16, 0, 30), Position = UDim2.new(0, 8, 0, 26), BackgroundTransparency = 1, Text = "> " .. text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.Code, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif})
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 65)}, 0.25)
	
	task.delay(duration or 4, function()
		tween(notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
		task.delay(0.3, function() pcall(function() notif:Destroy() end) end)
	end)
end

local function NotifyGradient(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Bg),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 14)
	
	local gradient = Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, TC(S.Theme.Accent)),
			ColorSequenceKeypoint.new(0.3, TC(S.Theme.Bg)),
			ColorSequenceKeypoint.new(1, TC(S.Theme.Bg))
		}),
		Rotation = 0,
		Parent = notif
	})
	
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1.5, Transparency = 0.5, Parent = notif})
	
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 22), Position = UDim2.new(0, 14, 0, 10), BackgroundTransparency = 1, Text = title, TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBlack, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 32), Position = UDim2.new(0, 14, 0, 32), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif})
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 75)}, 0.4, Enum.EasingStyle.Back)
	
	task.spawn(function()
		local rot = 0
		while notif.Parent do
			rot = (rot + 2) % 360
			gradient.Rotation = rot
			task.wait(0.03)
		end
	end)
	
	task.delay(duration or 4, function()
		tween(notif, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.45, function() pcall(function() notif:Destroy() end) end)
	end)
end
local function NotifyNeon(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(2, 2, 8),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 10)
	
	-- Основная неоновая обводка
	local mainStroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0, Parent = notif})
	
	-- Внутренний градиент свечения снизу
	local glowBottom = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), Position = UDim2.new(0, 0, 1, -40), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = notif})
	local glowGradient = Create("UIGradient", {
		Color = ColorSequence.new(TC(S.Theme.Accent)),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0.85)
		}),
		Rotation = 180,
		Parent = glowBottom
	})
	
	-- Горизонтальная светящаяся линия
	local horizLine = Create("Frame", {Size = UDim2.new(0, 0, 0, 1), Position = UDim2.new(0, 14, 0, 38), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = notif})
	
	-- Точка пульсации слева
	local pulseDot = Create("Frame", {Size = UDim2.new(0, 6, 0, 6), Position = UDim2.new(0, 14, 0, 16), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = notif})
	Corner(pulseDot, 3)
	
	Create("TextLabel", {Size = UDim2.new(1, -40, 0, 20), Position = UDim2.new(0, 28, 0, 12), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBlack, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	Create("TextLabel", {Size = UDim2.new(1, -28, 0, 34), Position = UDim2.new(0, 14, 0, 44), BackgroundTransparency = 1, Text = text, TextColor3 = Color3.fromRGB(220, 220, 230), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif})
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 88)}, 0.35, Enum.EasingStyle.Back)
	
	-- Анимация расширения линии
	task.delay(0.2, function()
		if notif.Parent then
			tween(horizLine, {Size = UDim2.new(0.7, 0, 0, 1)}, 0.5, Enum.EasingStyle.Quint)
		end
	end)
	
	-- Пульсация точки и обводки
	task.spawn(function()
		while notif.Parent do
			tween(pulseDot, {BackgroundTransparency = 0.7, Size = UDim2.new(0, 4, 0, 4), Position = UDim2.new(0, 15, 0, 17)}, 0.5)
			tween(mainStroke, {Transparency = 0.4}, 0.5)
			task.wait(0.5)
			tween(pulseDot, {BackgroundTransparency = 0, Size = UDim2.new(0, 6, 0, 6), Position = UDim2.new(0, 14, 0, 16)}, 0.5)
			tween(mainStroke, {Transparency = 0}, 0.5)
			task.wait(0.5)
		end
	end)
	
	task.delay(duration or 4, function()
		tween(horizLine, {Size = UDim2.new(0, 0, 0, 1)}, 0.2)
		tween(notif, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.4, function() pcall(function() notif:Destroy() end) end)
	end)
end

local function NotifyGlass(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.85,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 14)
	
	Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 0.5, Parent = notif})
	
	local gradient = Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
			ColorSequenceKeypoint.new(1, TC(S.Theme.Accent))
		}),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.9),
			NumberSequenceKeypoint.new(1, 0.95)
		}),
		Rotation = 45,
		Parent = notif
	})
	
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 22), Position = UDim2.new(0, 14, 0, 12), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBlack, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif}):SetAttribute("OrigTT", 0)
	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 32), Position = UDim2.new(0, 14, 0, 34), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif}):SetAttribute("OrigTT", 0)
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 78)}, 0.35, Enum.EasingStyle.Quint)
	
	task.delay(duration or 4, function()
		tween(notif, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		task.delay(0.4, function() pcall(function() notif:Destroy() end) end)
	end)
end

local function NotifyCyber(title, text, duration)
	local notif = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundColor3 = Color3.fromRGB(8, 12, 18),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = NotificationContainer
	})
	Corner(notif, 2)
	
	-- Сетка на фоне
	for i = 1, 8 do
		Create("Frame", {Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(0, 40 * i, 0, 0), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.92, BorderSizePixel = 0, Parent = notif})
	end
	for i = 1, 3 do
		Create("Frame", {Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 0, 25 * i), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.92, BorderSizePixel = 0, Parent = notif})
	end
	
	-- Верхняя линия
	local topLine = Create("Frame", {Size = UDim2.new(0.6, 0, 0, 2), Position = UDim2.new(0, 0, 0, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = notif})
	
	-- Глитч-блок справа сверху
	local glitchBlock = Create("Frame", {Size = UDim2.new(0, 40, 0, 8), Position = UDim2.new(1, -50, 0, 4), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = notif})
	Corner(glitchBlock, 1)
	
	-- HEX код
	local hexCode = Create("TextLabel", {Size = UDim2.new(0, 70, 0, 10), Position = UDim2.new(1, -80, 0, 14), BackgroundTransparency = 1, Text = "0x" .. string.format("%X", math.random(100000, 999999)), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.Code, TextSize = 9, TextTransparency = 0.4, TextXAlignment = Enum.TextXAlignment.Right, Parent = notif})
	
	-- Индикатор статуса
	local statusDot = Create("Frame", {Size = UDim2.new(0, 6, 0, 6), Position = UDim2.new(0, 12, 0, 20), BackgroundColor3 = Color3.fromRGB(0, 255, 100), BorderSizePixel = 0, Parent = notif})
	Corner(statusDot, 3)
	
	-- Статус текст
	local statusText = Create("TextLabel", {Size = UDim2.new(0, 50, 0, 10), Position = UDim2.new(0, 22, 0, 18), BackgroundTransparency = 1, Text = "ACTIVE", TextColor3 = Color3.fromRGB(0, 255, 100), Font = Enum.Font.Code, TextSize = 8, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	
	-- Заголовок
	Create("TextLabel", {Size = UDim2.new(1, -30, 0, 16), Position = UDim2.new(0, 12, 0, 32), BackgroundTransparency = 1, Text = "// " .. string.upper(title), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.Code, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = notif})
	
	-- Текст с эффектом печатания
	local msgText = Create("TextLabel", {Size = UDim2.new(1, -24, 0, 34), Position = UDim2.new(0, 12, 0, 50), BackgroundTransparency = 1, Text = "", TextColor3 = Color3.fromRGB(180, 180, 190), Font = Enum.Font.Code, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, Parent = notif})
	
	-- Прогресс-бар снизу
	local progressBg = Create("Frame", {Size = UDim2.new(1, -24, 0, 2), Position = UDim2.new(0, 12, 1, -10), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, BorderSizePixel = 0, Parent = notif})
	local progressFill = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = progressBg})
	Corner(progressFill, 1)
	
	tween(notif, {Size = UDim2.new(1, 0, 0, 95)}, 0.25, Enum.EasingStyle.Quint)
	
	-- Анимация прогресс-бара
	tween(progressFill, {Size = UDim2.new(0, 0, 1, 0)}, duration or 4, Enum.EasingStyle.Linear)
	
	-- Эффект печатания
	task.spawn(function()
		task.wait(0.3)
		for i = 1, #text do
			if not notif.Parent then break end
			msgText.Text = string.sub(text, 1, i) .. "_"
			task.wait(0.025)
		end
		if notif.Parent then
			msgText.Text = text
		end
	end)
	
	-- Глитч и мигание
	task.spawn(function()
		while notif.Parent do
			-- Мигание статуса
			tween(statusDot, {BackgroundTransparency = 0.6}, 0.15)
			task.wait(0.15)
			tween(statusDot, {BackgroundTransparency = 0}, 0.15)
			
			-- Глитч блока
			glitchBlock.Size = UDim2.new(0, math.random(20, 60), 0, math.random(4, 10))
			glitchBlock.Position = UDim2.new(1, -math.random(40, 80), 0, math.random(2, 8))
			glitchBlock.BackgroundTransparency = math.random(40, 70) / 100
			
			-- Обновление HEX
			hexCode.Text = "0x" .. string.format("%X", math.random(100000, 999999))
			
			task.wait(0.35)
		end
	end)
	
	task.delay(duration or 4, function()
		-- Глитч при закрытии
		for i = 1, 4 do
			notif.Position = UDim2.new(0, math.random(-3, 3), 0, 0)
			notif.BackgroundTransparency = math.random(0, 30) / 100
			task.wait(0.025)
		end
		notif.Position = UDim2.new(0, 0, 0, 0)
		tween(notif, {Size = UDim2.new(1, 0, 0, 0)}, 0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		task.delay(0.2, function() pcall(function() notif:Destroy() end) end)
	end)
end

local function Notify(title, text, duration)
	if not NotificationContainer then SetupNotificationSystem() end
	
	local style = S.NotificationStyle or "Modern"
	if style == "Modern" then
		NotifyModern(title, text, duration)
	elseif style == "Minimal" then
		NotifyMinimal(title, text, duration)
	elseif style == "Classic" then
		NotifyClassic(title, text, duration)
	elseif style == "Gradient" then
		NotifyGradient(title, text, duration)
	elseif style == "Neon" then
		NotifyNeon(title, text, duration)
	elseif style == "Glass" then
		NotifyGlass(title, text, duration)
	elseif style == "Cyber" then
		NotifyCyber(title, text, duration)
	else
		NotifyModern(title, text, duration)
	end
end

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

-- ═══════════════════════════════════════════
-- IMPROVED FLY SYSTEM (IY-STYLE)
-- ═══════════════════════════════════════════
-- ═══════════════════════════════════════════
-- FLY SYSTEM (ALL MODES)
-- ═══════════════════════════════════════════
flyConn = nil
flyBV = nil
flyBG = nil
flyPlatform = nil

StopAllFly = function()
	FLYING = false
	if flyConn then flyConn:Disconnect(); flyConn = nil end
	if flyKeyDown then flyKeyDown:Disconnect(); flyKeyDown = nil end
	if flyKeyUp then flyKeyUp:Disconnect(); flyKeyUp = nil end
	pcall(function()
		local root = getRoot()
		if root:FindFirstChild("NHFly") then root:FindFirstChild("NHFly"):Destroy() end
		if root:FindFirstChild("NHGyro") then root:FindFirstChild("NHGyro"):Destroy() end
		for _, v in pairs(root:GetChildren()) do
			if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then v:Destroy() end
		end
	end)
	pcall(function()
		if flyPlatform then flyPlatform:Destroy(); flyPlatform = nil end
	end)
	pcall(function()
		getHum().PlatformStand = false
		getHum():ChangeState(Enum.HumanoidStateType.GettingUp)
	end)
	flyBV, flyBG = nil, nil
end

StartFly = function(mode)
	StopAllFly()
	FLYING = true
	
	local root = getRoot()
	local hum = getHum()
	local cam = workspace.CurrentCamera
	
	if mode == "Default" then
		-- IY-style fly
		local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
		local SPEED = 0
		
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = root
		BV.Parent = root
		BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.CFrame = root.CFrame
		BV.Velocity = Vector3.new(0, 0, 0)
		BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		
		flyKeyDown = UIS.InputBegan:Connect(function(input, processed)
			if processed then return end
			if input.KeyCode == Enum.KeyCode.W then CONTROL.F = iyflyspeed
			elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = -iyflyspeed
			elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = -iyflyspeed
			elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = iyflyspeed
			elseif input.KeyCode == Enum.KeyCode.E and QEfly then CONTROL.Q = iyflyspeed * 2
			elseif input.KeyCode == Enum.KeyCode.Q and QEfly then CONTROL.E = -iyflyspeed * 2
			end
		end)

		flyKeyUp = UIS.InputEnded:Connect(function(input, processed)
			if processed then return end
			if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0
			elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0
			elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0
			elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0
			elseif input.KeyCode == Enum.KeyCode.E then CONTROL.Q = 0
			elseif input.KeyCode == Enum.KeyCode.Q then CONTROL.E = 0
			end
		end)
		
		flyConn = RunService.Heartbeat:Connect(function()
			if not FLYING then
				BG:Destroy()
				BV:Destroy()
				if hum then hum.PlatformStand = false end
				return
			end
			
			local camera = workspace.CurrentCamera
			if hum then hum.PlatformStand = true end

			if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
				SPEED = 50
			else
				SPEED = 0
			end
			
			if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
				BV.Velocity = ((camera.CFrame.LookVector * (CONTROL.F + CONTROL.B)) + ((camera.CFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - camera.CFrame.p)) * SPEED
				lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
			elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
				BV.Velocity = ((camera.CFrame.LookVector * (lCONTROL.F + lCONTROL.B)) + ((camera.CFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - camera.CFrame.p)) * SPEED
			else
				BV.Velocity = Vector3.new(0, 0, 0)
			end
			BG.CFrame = camera.CFrame
		end)
		
	elseif mode == "Swim" then
		flyConn = RunService.Heartbeat:Connect(function()
			if not FLYING then StopAllFly(); return end
			pcall(function()
				hum:ChangeState(Enum.HumanoidStateType.Swimming)
				local d = Vector3.zero
				if UIS:IsKeyDown(Enum.KeyCode.W) then d = d + cam.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.S) then d = d - cam.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.A) then d = d - cam.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.D) then d = d + cam.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.yAxis end
				if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then d = d - Vector3.yAxis end
				root.Velocity = d * S.FlySpeed
			end)
		end)
		
	elseif mode == "Noclip" then
		flyBV = Instance.new("BodyVelocity")
		flyBV.Name = "NHFly"
		flyBV.MaxForce = Vector3.one * 9e9
		flyBV.Velocity = Vector3.zero
		flyBV.Parent = root
		
		flyBG = Instance.new("BodyGyro")
		flyBG.Name = "NHGyro"
		flyBG.MaxTorque = Vector3.one * 9e9
		flyBG.D = 0
		flyBG.Parent = root
		
		flyConn = RunService.Stepped:Connect(function()
			if not FLYING then StopAllFly(); return end
			for _, part in pairs(getChar():GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
			end
			local d = Vector3.zero
			if UIS:IsKeyDown(Enum.KeyCode.W) then d = d + cam.CFrame.LookVector end
			if UIS:IsKeyDown(Enum.KeyCode.S) then d = d - cam.CFrame.LookVector end
			if UIS:IsKeyDown(Enum.KeyCode.A) then d = d - cam.CFrame.RightVector end
			if UIS:IsKeyDown(Enum.KeyCode.D) then d = d + cam.CFrame.RightVector end
			if UIS:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.yAxis end
			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then d = d - Vector3.yAxis end
			flyBV.Velocity = d * S.FlySpeed
			flyBG.CFrame = cam.CFrame
		end)
		
	elseif mode == "Platform" then
		flyPlatform = Instance.new("Part")
		flyPlatform.Name = "NHPlatform"
		flyPlatform.Size = Vector3.new(5, 1, 5)
		flyPlatform.Transparency = 1
		flyPlatform.Anchored = true
		flyPlatform.CanCollide = true
		flyPlatform.Parent = workspace
		
		flyConn = RunService.Heartbeat:Connect(function()
			if not FLYING then StopAllFly(); return end
			pcall(function()
				local pos = root.Position
				local d = Vector3.zero
				if UIS:IsKeyDown(Enum.KeyCode.W) then d = d + cam.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.S) then d = d - cam.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.A) then d = d - cam.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.D) then d = d + cam.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.Space) then d = d + Vector3.yAxis end
				if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then d = d - Vector3.yAxis end
				
				local newPos = pos + d * S.FlySpeed * 0.016
				root.CFrame = CFrame.new(newPos)
				flyPlatform.CFrame = CFrame.new(newPos - Vector3.new(0, 3.5, 0))
			end)
		end)
	end
end

-- ═══════════════════════════════════════════
-- IMPROVED FLING SYSTEM (IY-STYLE)
-- ═══════════════════════════════════════════
local function randomString()
	local length = math.random(10, 20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function StartFlingIY()
	flinging = false
	local speaker = Player
	
	for _, child in pairs(speaker.Character:GetDescendants()) do
		if child:IsA("BasePart") then
			child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
		end
	end
	
	-- Enable noclip
	S.Noclip = true
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(true)
	end
	Notify(L("hub_name"), L("noclip_enabled_auto"), 2)
	
	task.wait(0.1)
	local bambam = Instance.new("BodyAngularVelocity")
	bambam.Name = randomString()
	bambam.Parent = getRoot()
	bambam.AngularVelocity = Vector3.new(0, 99999, 0)
	bambam.MaxTorque = Vector3.new(0, math.huge, 0)
	bambam.P = math.huge
	
	local Char = speaker.Character:GetChildren()
	for i, v in next, Char do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Massless = true
			v.Velocity = Vector3.new(0, 0, 0)
		end
	end
	
	flinging = true
	
	local function flingDiedF()
		StopFlingIY()
	end
	
	flingDied = speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
	
	task.spawn(function()
		repeat
			bambam.AngularVelocity = Vector3.new(0, 99999, 0)
			task.wait(0.2)
			bambam.AngularVelocity = Vector3.new(0, 0, 0)
			task.wait(0.1)
		until flinging == false
	end)
end

local function StopFlingIY()
	-- Disable noclip
	S.Noclip = false
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(false)
	end
	
	if flingDied then
		flingDied:Disconnect()
	end
	flinging = false
	task.wait(0.1)
	
	local speakerChar = Player.Character
	if not speakerChar or not getRoot() then return end
	
	for i, v in pairs(getRoot():GetChildren()) do
		if v.ClassName == 'BodyAngularVelocity' then
			v:Destroy()
		end
	end
	
	for _, child in pairs(speakerChar:GetDescendants()) do
		if child.ClassName == "Part" or child.ClassName == "MeshPart" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
end

-- ═══════════════════════════════════════════
-- WALK FLING SYSTEM (IY-STYLE)
-- ═══════════════════════════════════════════
local function StartWalkFling()
	StopWalkFling()
	local speaker = Player
	local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid.Died:Connect(function()
			StopWalkFling()
		end)
	end

	-- Enable noclip
	S.Noclip = true
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(true)
	end
	Notify(L("hub_name"), L("noclip_enabled_auto"), 2)
	
	walkflinging = true
	
	task.spawn(function()
		repeat 
			RunService.Heartbeat:Wait()
			local character = speaker.Character
			local root = getRoot()
			local vel, movel = nil, 0.1

			while not (character and character.Parent and root and root.Parent) do
				RunService.Heartbeat:Wait()
				character = speaker.Character
				root = character and character:FindFirstChild("HumanoidRootPart")
			end

			vel = root.Velocity
			root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

			RunService.RenderStepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel
			end

			RunService.Stepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		until walkflinging == false
	end)
end

local function StopWalkFling()
	walkflinging = false
	S.Noclip = false
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(false)
	end
end

-- ═══════════════════════════════════════════
-- FLY FLING SYSTEM (IY-STYLE)  
-- ═══════════════════════════════════════════
local function StartFlyFling()
	-- Enable noclip
	S.Noclip = true
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(true)
	end
	Notify(L("hub_name"), L("noclip_enabled_auto"), 2)
	
	-- Start fly
	iyflyspeed = S.FlySpeed / 50
	sFLY()
	
	-- Start walk fling
	walkflinging = true
	local speaker = Player
	
	task.spawn(function()
		repeat 
			RunService.Heartbeat:Wait()
			local character = speaker.Character
			local root = getRoot()
			local vel, movel = nil, 0.1

			while not (character and character.Parent and root and root.Parent) do
				RunService.Heartbeat:Wait()
				character = speaker.Character
				root = character and character:FindFirstChild("HumanoidRootPart")
			end

			vel = root.Velocity
			root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)

			RunService.RenderStepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel
			end

			RunService.Stepped:Wait()
			if character and character.Parent and root and root.Parent then
				root.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		until walkflinging == false
	end)
end

local function StopFlyFling()
	NOFLY()
	walkflinging = false
	S.Noclip = false
	if ToggleRefs["Noclip"] then
		ToggleRefs["Noclip"].Set(false)
	end
	
	-- Break velocity
	pcall(function()
		local root = getRoot()
		root.Velocity = Vector3.zero
		root.AssemblyLinearVelocity = Vector3.zero
	end)
end

-- ═══════════════════════════════════════════
-- LOADING SCREEN (SYNCED WITH THEME)
-- ═══════════════════════════════════════════
local LoaderGui = Create("ScreenGui", {Name = "NHLoader", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, LoaderGui)
LoaderGui.Parent = CoreGui

local LoaderWindow = Create("Frame", {
	Size = UDim2.new(0, 380, 0, 280),
	Position = UDim2.new(0.5, -190, 0.5, -140),
	BackgroundColor3 = TC(S.Theme.Bg),
	BorderSizePixel = 0,
	Parent = LoaderGui
})
Corner(LoaderWindow, 16)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = LoaderWindow})

local RingsContainer = Create("Frame", {
	Size = UDim2.new(0, 100, 0, 100),
	Position = UDim2.new(0.5, -50, 0, 20),
	BackgroundTransparency = 1,
	Parent = LoaderWindow
})

for i = 1, 3 do
	local ring = Create("Frame", {
		Size = UDim2.new(0, 30 + i * 20, 0, 30 + i * 20),
		Position = UDim2.new(0.5, -(15 + i * 10), 0.5, -(15 + i * 10)),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Parent = RingsContainer
	})
	local stroke = Create("UIStroke", {
		Color = TC(S.Theme.Accent),
		Thickness = 3 - i * 0.5,
		Transparency = 0.3 + i * 0.15,
		Parent = ring
	})
	Corner(ring, 100)
	
	task.spawn(function()
		local speed = (4 - i) * 1.5
		local direction = i % 2 == 0 and 1 or -1
		while ring.Parent do
			ring.Rotation = ring.Rotation + speed * direction
			task.wait(0.016)
		end
	end)
end

local LogoFrame = Create("Frame", {
	Size = UDim2.new(0, 50, 0, 50),
	Position = UDim2.new(0.5, -25, 0.5, -25),
	BackgroundColor3 = TC(S.Theme.Accent),
	BorderSizePixel = 0,
	Parent = RingsContainer
})
Corner(LogoFrame, 25)

local LogoText = Create("TextLabel", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "N",
	TextColor3 = Color3.new(1, 1, 1),
	Font = Enum.Font.GothamBlack,
	TextSize = 28,
	Parent = LogoFrame
})

local TitleLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 32),
	Position = UDim2.new(0, 0, 0, 130),
	BackgroundTransparency = 1,
	Text = "Neo's Hub",
	TextColor3 = TC(S.Theme.Text),
	Font = Enum.Font.GothamBlack,
	TextSize = 28,
	TextTransparency = 1,
	Parent = LoaderWindow
})

local VersionLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 16),
	Position = UDim2.new(0, 0, 0, 162),
	BackgroundTransparency = 1,
	Text = "v3.0 — Universal Menu",
	TextColor3 = TC(S.Theme.SubText),
	Font = Enum.Font.GothamBold,
	TextSize = 12,
	TextTransparency = 1,
	Parent = LoaderWindow
})

local ProgressContainer = Create("Frame", {
	Size = UDim2.new(0.8, 0, 0, 40),
	Position = UDim2.new(0.1, 0, 0, 190),
	BackgroundTransparency = 1,
	Parent = LoaderWindow
})

local ProgressBg = Create("Frame", {
	Size = UDim2.new(1, 0, 0, 6),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundColor3 = TC(S.Theme.ToggleOff),
	BorderSizePixel = 0,
	Parent = ProgressContainer
})
Corner(ProgressBg, 3)

local ProgressFill = Create("Frame", {
	Size = UDim2.new(0, 0, 1, 0),
	BackgroundColor3 = TC(S.Theme.Accent),
	BorderSizePixel = 0,
	Parent = ProgressBg
})
Corner(ProgressFill, 3)

local StatusLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 16),
	Position = UDim2.new(0, 0, 0, 14),
	BackgroundTransparency = 1,
	Text = "",
	TextColor3 = TC(S.Theme.SubText),
	Font = Enum.Font.GothamSemibold,
	TextSize = 11,
	TextTransparency = 1,
	Parent = ProgressContainer
})

task.spawn(function()
	task.wait(0.3)
	tween(TitleLabel, {TextTransparency = 0}, 0.6)
	task.wait(0.3)
	tween(VersionLabel, {TextTransparency = 0}, 0.4)
	tween(StatusLabel, {TextTransparency = 0}, 0.4)
	task.wait(0.2)
	
	local steps = {
		{0.15, "loading_init"},
		{0.35, "loading_gui"},
		{0.65, "loading_hooks"},
		{0.85, "loading_done"},
		{1.0, "loading_done"}
	}
	
	for _, step in ipairs(steps) do
		StatusLabel.Text = L(step[2])
		tween(ProgressFill, {Size = UDim2.new(step[1], 0, 1, 0)}, 0.5)
		task.wait(0.5)
	end
	
	task.wait(0.5)
	
	tween(LoaderWindow, {BackgroundTransparency = 1}, 0.5)
	for _, desc in pairs(LoaderWindow:GetDescendants()) do
		pcall(function()
			if desc:IsA("TextLabel") then
				tween(desc, {TextTransparency = 1}, 0.4)
			elseif desc:IsA("Frame") then
				tween(desc, {BackgroundTransparency = 1}, 0.4)
			end
			if desc:IsA("UIStroke") then
				tween(desc, {Transparency = 1}, 0.4)
			end
		end)
	end
	
	task.wait(0.6)
	LoaderGui:Destroy()
end)

task.wait(3.5)

-- ═══════════════════════════════════════════
-- MAIN GUI
-- ═══════════════════════════════════════════
local Gui = Create("ScreenGui", {Name = "NeoHub", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, Gui)
Gui.Parent = CoreGui

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

-- Show blur immediately when menu appears
if S.BlurBackground then
	ShowBlurImmediate()
end

local fullSize = UDim2.new(0, defaultWidth, 0, defaultHeight)
tween(Main, {Size = fullSize, Position = UDim2.new(0.5, -defaultWidth/2, 0.5, -defaultHeight/2)}, 0.7, Enum.EasingStyle.Back)

local MinimizedBar = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, Visible = false, ZIndex = 10, Parent = Main})
Create("TextLabel", {Size = UDim2.new(1, -90, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1, Text = "Neo's Hub", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 10, Parent = MinimizedBar})
local MinBarExpand = Create("TextButton", {Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -40, 0.5, -15), BackgroundColor3 = TC(S.Theme.Card), Text = "+", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 18, BorderSizePixel = 0, ZIndex = 10, Parent = MinimizedBar})
Corner(MinBarExpand, 8)

local minimized = false

-- ═══ RESIZE HANDLE ═══
local ResizeHandle = Create("Frame", {
	Size = UDim2.new(0, 20, 0, 20),
	Position = UDim2.new(1, -24, 1, -24),
	BackgroundTransparency = 1,
	ZIndex = 50,
	Parent = Main
})

for i = 1, 3 do
	local line = Create("Frame", {
		Size = UDim2.new(0, 2, 0, 4 + i * 3),
		Position = UDim2.new(0, 2 + (i-1) * 5, 1, -6 - (i-1) * 3),
		Rotation = 45,
		BackgroundColor3 = TC(S.Theme.Accent),
		BackgroundTransparency = 0.4,
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

local isResizing = false
local resizeStartPos, resizeStartSize

resizeBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isResizing = true
		resizeStartPos = input.Position
		resizeStartSize = Main.Size
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then
				tween(line, {BackgroundTransparency = 0.1}, 0.1)
			end
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isResizing = false
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then
				tween(line, {BackgroundTransparency = 0.4}, 0.1)
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
		if line:IsA("Frame") then tween(line, {BackgroundTransparency = 0.2}, 0.15) end
	end
end)
resizeBtn.MouseLeave:Connect(function()
	if not isResizing then
		for _, line in pairs(ResizeHandle:GetChildren()) do
			if line:IsA("Frame") then tween(line, {BackgroundTransparency = 0.4}, 0.15) end
		end
	end
end)

-- Drag
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

-- ═══ BACKGROUND PARTICLES (USES THEME ACCENT COLOR) ═══
local particleContainer = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 0, Parent = Main})
local activeParticles = {}
local particleRunning = false
local ParticleChars = {"*", ".", "o", "+", "x"}

local function ClearParticles()
	particleRunning = false
	for _, pp in pairs(activeParticles) do pcall(function() pp:Destroy() end) end
	activeParticles = {}
end

local function SpawnParticles()
	ClearParticles()
	if not S.ParticlesEnabled then return end
	particleRunning = true
	local chars = ParticleChars
	
	task.spawn(function()
		while particleRunning and Main.Parent do
			if #activeParticles >= S.ParticleAmount then
				task.wait(0.1)
				continue
			end
			
			local ch = chars[math.random(1, #chars)]
			local startX = math.random(5, 95) / 100
			local size = S.ParticleSize or 12
			local color = TC(S.Theme.Accent)
			
			local lbl = Create("TextLabel", {
				Size = UDim2.new(0, size * 2, 0, size * 2),
				Position = UDim2.new(startX, 0, 0, -size),
				BackgroundTransparency = 1,
				Text = ch,
				TextColor3 = color,
				TextTransparency = math.random(30, 60) / 100,
				Font = Enum.Font.GothamBold,
				TextSize = size,
				ZIndex = 0,
				Rotation = math.random(-15, 15),
				Parent = particleContainer
			})
			table.insert(activeParticles, lbl)
			
			local dur = math.random(40, 70) / 10
			local endX = startX + (math.random() - 0.5) * 0.1
			
			tween(lbl, {
				Position = UDim2.new(endX, 0, 1, size),
				TextTransparency = 0.9,
				Rotation = lbl.Rotation + math.random(-20, 20)
			}, dur, Enum.EasingStyle.Linear)
			
			task.delay(dur + 0.1, function() 
				pcall(function() 
					lbl:Destroy() 
					for i, p in ipairs(activeParticles) do
						if p == lbl then
							table.remove(activeParticles, i)
							break
						end
					end
				end) 
			end)
			
			local spawnDelay = 3 / math.max(S.ParticleAmount, 1)
			task.wait(spawnDelay)
		end
	end)
end

if S.ParticlesEnabled then
	task.delay(1, function() SpawnParticles() end)
end
-- ═══ SIDEBAR ═══
local Sidebar = Create("Frame", {Size = UDim2.new(0, 180, 1, 0), BackgroundColor3 = TC(S.Theme.Sidebar), BorderSizePixel = 0, Parent = Main})
Corner(Sidebar, 16)
local SidebarCover = Create("Frame", {Size = UDim2.new(0, 16, 1, 0), Position = UDim2.new(1, -16, 0, 0), BackgroundColor3 = TC(S.Theme.Sidebar), BorderSizePixel = 0, Parent = Sidebar})

local ProfFrame = Create("Frame", {Size = UDim2.new(1, 0, 0, 95), BackgroundTransparency = 1, Parent = Sidebar})
local AvFrame = Create("Frame", {Size = UDim2.new(0, 52, 0, 52), Position = UDim2.new(0, 14, 0, 14), BackgroundColor3 = TC(S.Theme.Card), Parent = ProfFrame})
Corner(AvFrame, 26)
Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Transparency = 0.3, Parent = AvFrame})
local AvImg = Create("ImageLabel", {Size = UDim2.new(1, -4, 1, -4), Position = UDim2.new(0, 2, 0, 2), BackgroundTransparency = 1, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100), Parent = AvFrame})
Corner(AvImg, 24)

-- Avatar click for profile popup
local AvBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = AvFrame})

Create("TextLabel", {Size = UDim2.new(1, -78, 0, 20), Position = UDim2.new(0, 74, 0, 14), BackgroundTransparency = 1, Text = Player.DisplayName, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Parent = ProfFrame})
Create("TextLabel", {Size = UDim2.new(1, -78, 0, 16), Position = UDim2.new(0, 74, 0, 34), BackgroundTransparency = 1, Text = "@" .. Player.Name, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Parent = ProfFrame})

-- Status label based on HUB_STATUS variable
local statusLabel = Create("TextLabel", {Size = UDim2.new(0, 80, 0, 16), Position = UDim2.new(0, 74, 0, 52), BackgroundTransparency = 1, Text = "Active", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = ProfFrame})

if HUB_STATUS == "work" then
	statusLabel.Text = "Working"
	task.spawn(function() 
		while statusLabel.Parent do 
			local hue = (tick() * 0.3) % 1
			tween(statusLabel, {TextColor3 = Color3.fromHSV(hue, 0.6, 1)}, 0.5)
			task.wait(0.5) 
		end 
	end)
elseif HUB_STATUS == "rewrite" then
	statusLabel.Text = "On Rewriting"
	task.spawn(function()
		while statusLabel.Parent do
			tween(statusLabel, {TextColor3 = Color3.fromRGB(255, 80, 80)}, 0.5)
			task.wait(0.5)
			tween(statusLabel, {TextColor3 = Color3.fromRGB(200, 40, 40)}, 0.5)
			task.wait(0.5)
		end
	end)
elseif HUB_STATUS == "unstable" then
	statusLabel.Text = "Unstable"
	task.spawn(function()
		while statusLabel.Parent do
			tween(statusLabel, {TextColor3 = Color3.fromRGB(255, 220, 50)}, 0.5)
			task.wait(0.5)
			tween(statusLabel, {TextColor3 = Color3.fromRGB(255, 180, 0)}, 0.5)
			task.wait(0.5)
		end
	end)
else
	statusLabel.Text = "Active"
	task.spawn(function() 
		while statusLabel.Parent do 
			local hue = (tick() * 0.3) % 1
			tween(statusLabel, {TextColor3 = Color3.fromHSV(hue, 0.6, 1)}, 0.5)
			task.wait(0.5) 
		end 
	end)
end

Create("Frame", {Size = UDim2.new(1, -28, 0, 1), Position = UDim2.new(0, 14, 0, 88), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = ProfFrame})

-- ═══ PROFILE POPUP ═══
local function ShowProfilePopup()
	pcall(function() CoreGui:FindFirstChild("NHProfilePopup"):Destroy() end)
	
	local popupGui = Create("ScreenGui", {Name = "NHProfilePopup", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	pcall(ProtectGui, popupGui); popupGui.Parent = CoreGui
	
	local popup = Create("Frame", {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = TC(S.Theme.Bg),
		BorderSizePixel = 0,
		ZIndex = 200,
		Parent = popupGui
	})
	Corner(popup, 16)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Parent = popup})
	
	tween(popup, {Size = UDim2.new(0, 340, 0, 320)}, 0.4, Enum.EasingStyle.Back)
	task.wait(0.15)
	
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 28), Position = UDim2.new(0, 0, 0, 12), BackgroundTransparency = 1, Text = L("profile_info"), TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBlack, TextSize = 18, ZIndex = 201, Parent = popup})
	
	local closeBtn = Create("TextButton", {Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -36, 0, 8), BackgroundColor3 = TC(S.Theme.Card), Text = "X", TextColor3 = TC(S.Theme.Danger), Font = Enum.Font.GothamBold, TextSize = 14, BorderSizePixel = 0, ZIndex = 202, Parent = popup})
	Corner(closeBtn, 8)
	closeBtn.MouseButton1Click:Connect(function()
		tween(popup, {Size = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.35, function() popupGui:Destroy() end)
	end)
	
	local avBig = Create("Frame", {Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0.5, -35, 0, 50), BackgroundColor3 = TC(S.Theme.Card), ZIndex = 201, Parent = popup})
	Corner(avBig, 35)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 3, Parent = avBig})
	local avImgBig = Create("ImageLabel", {Size = UDim2.new(1, -6, 1, -6), Position = UDim2.new(0, 3, 0, 3), BackgroundTransparency = 1, Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150), ZIndex = 202, Parent = avBig})
	Corner(avImgBig, 32)
	
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 22), Position = UDim2.new(0, 0, 0, 128), BackgroundTransparency = 1, Text = Player.DisplayName, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 16, ZIndex = 201, Parent = popup})
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 0, 150), BackgroundTransparency = 1, Text = "@" .. Player.Name, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, ZIndex = 201, Parent = popup})
	
	local infoY = 180
	local function addInfoRow(label, value)
		local row = Create("Frame", {Size = UDim2.new(1, -32, 0, 28), Position = UDim2.new(0, 16, 0, infoY), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, ZIndex = 201, Parent = popup})
		Corner(row, 6)
		Create("TextLabel", {Size = UDim2.new(0.5, 0, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = label, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 202, Parent = row})
		Create("TextLabel", {Size = UDim2.new(0.5, -10, 1, 0), Position = UDim2.new(0.5, 0, 0, 0), BackgroundTransparency = 1, Text = value, TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 202, Parent = row})
		infoY = infoY + 32
	end
	
	addInfoRow(L("player_id"), tostring(Player.UserId))
	addInfoRow(L("account_age"), tostring(Player.AccountAge) .. " " .. L("days"))
	
	local gameName = "Unknown"
	pcall(function() gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name end)
	addInfoRow(L("place_name"), string.sub(gameName, 1, 20))
	addInfoRow("PlaceId", tostring(game.PlaceId))
	
	-- Draggable
	do
		local dr, ds, sp
		popup.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 then
				local ry = i.Position.Y - popup.AbsolutePosition.Y
				if ry <= 45 then
					dr = true; ds = i.Position; sp = popup.Position
					i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end)
				end
			end
		end)
		UIS.InputChanged:Connect(function(i)
			if dr and i.UserInputType == Enum.UserInputType.MouseMovement then
				local d = i.Position - ds
				popup.Position = UDim2.new(0.5, d.X, 0.5, d.Y)
			end
		end)
	end
end

AvBtn.MouseButton1Click:Connect(ShowProfilePopup)

local TabFrame = Create("Frame", {Size = UDim2.new(1, 0, 1, -105), Position = UDim2.new(0, 0, 0, 100), BackgroundTransparency = 1, Parent = Sidebar})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 3), Parent = TabFrame})
Pad(TabFrame, 6, 6, 6, 6)

local tabData = {
	{key = "tab_movement", order = 1}, 
	{key = "tab_visual", order = 2},
	{key = "tab_misc", order = 3}, 
	{key = "tab_settings", order = 4},
	{key = "tab_themes", order = 5},
	{key = "tab_credits", order = 6},
}

local tabButtons, tabPages, activeTab = {}, {}, nil

local ContentArea = Create("Frame", {Size = UDim2.new(1, -188, 1, -12), Position = UDim2.new(0, 184, 0, 6), BackgroundTransparency = 1, ClipsDescendants = true, Parent = Main})

local TitleBar = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundTransparency = 1, Parent = ContentArea})
local PageTitleLabel = Create("TextLabel", {Size = UDim2.new(1, -100, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBlack, TextSize = 22, TextXAlignment = Enum.TextXAlignment.Left, Parent = TitleBar})
Create("TextLabel", {Size = UDim2.new(0, 140, 0, 14), Position = UDim2.new(0, 8, 1, -16), BackgroundTransparency = 1, Text = "Neo's Hub v3.0", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Parent = TitleBar})

local CloseBtn = Create("TextButton", {Size = UDim2.new(0, 34, 0, 34), Position = UDim2.new(1, -42, 0, 5), BackgroundColor3 = TC(S.Theme.Card), Text = "X", TextColor3 = TC(S.Theme.Danger), Font = Enum.Font.GothamBold, TextSize = 18, BorderSizePixel = 0, Parent = TitleBar})
Corner(CloseBtn, 10)
CloseBtn.MouseButton1Click:Connect(function()
	if isToggling then return end
	isToggling = true
	guiVis = false
	SaveCurrentTheme()
	HideBlurImmediate()
	tween(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
	task.delay(0.35, function() 
		Main.Visible = false 
		isToggling = false
	end)
	ShowToast(string.format(L("hidden_hint"), S.Keybinds.ToggleMenu or "RightControl"), 5)
end)
CloseBtn.MouseEnter:Connect(function() tween(CloseBtn, {BackgroundColor3 = TC(S.Theme.Danger), TextColor3 = Color3.new(1,1,1)}, 0.15) end)
CloseBtn.MouseLeave:Connect(function() tween(CloseBtn, {BackgroundColor3 = TC(S.Theme.Card), TextColor3 = TC(S.Theme.Danger)}, 0.15) end)

local MinBtn = Create("TextButton", {Size = UDim2.new(0, 34, 0, 34), Position = UDim2.new(1, -82, 0, 5), BackgroundColor3 = TC(S.Theme.Card), Text = "-", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 16, BorderSizePixel = 0, Parent = TitleBar})
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
		ScrollingEnabled = true,
		Visible = false, Parent = ContentArea
	})
	Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6), Parent = page})
	Pad(page, 4, 8, 4, 8)
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
		for _, ch in pairs(pg:GetChildren()) do if ch:IsA("GuiObject") then task.delay(d2, function() tween(ch, {BackgroundTransparency = ch:GetAttribute("OrigBT") or 0}, 0.25); pcall(function() for _, sub in pairs(ch:GetDescendants()) do if sub:IsA("TextLabel") or sub:IsA("TextButton") or sub:IsA("TextBox") then tween(sub, {TextTransparency = sub:GetAttribute("OrigTT") or 0}, 0.25) end end end) end); d2 = d2 + 0.03 end end
	end)
end

for _, td in ipairs(tabData) do
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 1, Text = "", BorderSizePixel = 0, LayoutOrder = td.order, Parent = TabFrame})
	Corner(btn, 10)
	Create("Frame", {Name = "Indicator", Size = UDim2.new(0, 3, 0.6, 0), Position = UDim2.new(0, 0, 0.2, 0), BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = btn}); Corner(btn:FindFirstChild("Indicator"), 2)
	Create("TextLabel", {Size = UDim2.new(1, -18, 1, 0), Position = UDim2.new(0, 12, 0, 0), BackgroundTransparency = 1, Text = L(td.key), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = btn})
	btn.MouseEnter:Connect(function() if activeTab ~= td.key then tween(btn, {BackgroundTransparency = 0.85, BackgroundColor3 = TC(S.Theme.Accent)}, 0.15) end end)
	btn.MouseLeave:Connect(function() if activeTab ~= td.key then tween(btn, {BackgroundTransparency = 1}, 0.15) end end)
	btn.MouseButton1Click:Connect(function() SwitchTab(td.key) end)
	tabButtons[td.key] = btn; MakePage(td.key)
end

-- ═══ UI COMPONENTS ═══

local function ShowKeybindPopup(name, callback)
	if keybindPopupOpen then return end
	keybindPopupOpen = true
	
	local popup = Create("Frame", {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundColor3 = TC(S.Theme.Bg),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		ZIndex = 101,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = Gui
	})
	Corner(popup, 16)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Parent = popup})
	
	tween(popup, {Size = UDim2.new(0, 320, 0, 160)}, 0.35, Enum.EasingStyle.Back)
	
	task.wait(0.1)
	
	Create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 30),
		Position = UDim2.new(0, 10, 0, 12),
		BackgroundTransparency = 1,
		Text = L("set_keybind") .. ": " .. name,
		TextColor3 = TC(S.Theme.Text),
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 102,
		Parent = popup
	})
	
	local statusLbl = Create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 24),
		Position = UDim2.new(0, 10, 0, 50),
		BackgroundTransparency = 1,
		Text = L("press_key"),
		TextColor3 = TC(S.Theme.Accent),
		Font = Enum.Font.GothamBold,
		TextSize = 18,
		ZIndex = 102,
		Parent = popup
	})
	
	task.spawn(function()
		while statusLbl.Parent do
			tween(statusLbl, {TextTransparency = 0.3}, 0.5)
			task.wait(0.5)
			tween(statusLbl, {TextTransparency = 0}, 0.5)
			task.wait(0.5)
		end
	end)
	
	local warningLbl = Create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 18),
		Position = UDim2.new(0, 10, 0, 78),
		BackgroundTransparency = 1,
		Text = "",
		TextColor3 = TC(S.Theme.Danger),
		Font = Enum.Font.GothamSemibold,
		TextSize = 11,
		ZIndex = 102,
		TextWrapped = true,
		Parent = popup
	})
	
	local btnContainer = Create("Frame", {
		Size = UDim2.new(1, -20, 0, 36),
		Position = UDim2.new(0, 10, 1, -46),
		BackgroundTransparency = 1,
		ZIndex = 102,
		Parent = popup
	})
	
	local cancelBtn = Create("TextButton", {
		Size = UDim2.new(0.48, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Card),
		Text = L("cancel"),
		TextColor3 = TC(S.Theme.SubText),
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		BorderSizePixel = 0,
		ZIndex = 103,
		Parent = btnContainer
	})
	Corner(cancelBtn, 10)
	
	local clearBtn = Create("TextButton", {
		Size = UDim2.new(0.48, 0, 1, 0),
		Position = UDim2.new(0.52, 0, 0, 0),
		BackgroundColor3 = TC(S.Theme.Danger),
		BackgroundTransparency = 0.8,
		Text = "Clear",
		TextColor3 = TC(S.Theme.Danger),
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		BorderSizePixel = 0,
		ZIndex = 103,
		Parent = btnContainer
	})
	Corner(clearBtn, 10)
	
	local conn
	local function cleanup()
		keybindPopupOpen = false
		pcall(function() if conn then conn:Disconnect() end end)
		tween(popup, {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.3, function() pcall(function() popup:Destroy() end) end)
	end
	
	cancelBtn.MouseButton1Click:Connect(cleanup)
	cancelBtn.MouseEnter:Connect(function() tween(cancelBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
	cancelBtn.MouseLeave:Connect(function() tween(cancelBtn, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
	
	clearBtn.MouseButton1Click:Connect(function()
		SetKeybindForName(name, "None")
		cleanup()
		if callback then callback("None") end
	end)
	clearBtn.MouseEnter:Connect(function() tween(clearBtn, {BackgroundTransparency = 0.5}, 0.1) end)
	clearBtn.MouseLeave:Connect(function() tween(clearBtn, {BackgroundTransparency = 0.8}, 0.1) end)
	
	conn = UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local keyName = input.KeyCode.Name
			if keyName == "Escape" then
				cleanup()
				return
			end
			
			local existingUser = FindKeybindByKey(keyName)
			if existingUser and existingUser ~= name then
				warningLbl.Text = string.format(L("keybind_already_used"), keyName, existingUser)
				tween(warningLbl, {TextColor3 = TC(S.Theme.Danger)}, 0.1)
				tween(popup, {Position = UDim2.new(0.5, 5, 0.5, 0)}, 0.05)
				task.delay(0.05, function() tween(popup, {Position = UDim2.new(0.5, -5, 0.5, 0)}, 0.05) end)
				task.delay(0.1, function() tween(popup, {Position = UDim2.new(0.5, 0, 0.5, 0)}, 0.05) end)
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
				if ry <= 50 then
					dr = true; ds = i.Position; sp = popup.Position
					i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end)
				end
			end
		end)
		UIS.InputChanged:Connect(function(i)
			if dr and i.UserInputType == Enum.UserInputType.MouseMovement then
				local d = i.Position - ds
				popup.Position = UDim2.new(0.5, d.X, 0.5, d.Y)
			end
		end)
	end
end

local function Section(parent, text)
	local s = Create("Frame", {Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 1, Parent = parent}); s:SetAttribute("OrigBT", 1)
	Create("TextLabel", {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Parent = s}):SetAttribute("OrigTT", 0)
	Create("Frame", {Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, -2), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.8, BorderSizePixel = 0, Parent = s}):SetAttribute("OrigBT", 0.8)
end

local function Toggle(parent, text, default, callback, keybindName)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 10)
	Create("TextLabel", {Size = UDim2.new(1, -70, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local tbg = Create("Frame", {Size = UDim2.new(0, 44, 0, 24), Position = UDim2.new(1, -56, 0.5, -12), BackgroundColor3 = default and TC(S.Theme.ToggleOn) or TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); tbg:SetAttribute("OrigBT", 0); Corner(tbg, 12)
	local circ = Create("Frame", {Size = UDim2.new(0, 18, 0, 18), Position = default and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, Parent = tbg}); circ:SetAttribute("OrigBT", 0); Corner(circ, 9)
	local enabled = default
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = container})
	local kbName = keybindName or text:gsub("[^%w]", "")
	local function upd()
		tween(tbg, {BackgroundColor3 = enabled and TC(S.Theme.ToggleOn) or TC(S.Theme.ToggleOff)}, 0.25)
		tween(circ, {Position = enabled and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)}, 0.25, Enum.EasingStyle.Back)
		SetKeybindState(kbName, enabled); UpdateKeybindPanel()
	end
	btn.MouseButton1Click:Connect(function() enabled = not enabled; upd(); callback(enabled) end)
	btn.MouseButton2Click:Connect(function() ShowKeybindPopup(kbName, function(key) RegisterKeybind(kbName, function() enabled = not enabled; upd(); callback(enabled) end, key); UpdateKeybindPanel(); Notify(L("hub_name"), kbName .. " -> " .. key, 2) end) end)
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
	if S.Keybinds[kbName] and S.Keybinds[kbName] ~= "None" then RegisterKeybind(kbName, function() enabled = not enabled; upd(); callback(enabled) end, S.Keybinds[kbName]) end
	local ref = {Set = function(v) enabled = v; upd() end, Get = function() return enabled end}
	ToggleRefs[kbName] = ref; return ref
end

local function Slider(parent, text, min, max, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 56), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 10)
	Create("TextLabel", {Size = UDim2.new(1, -70, 0, 22), Position = UDim2.new(0, 14, 0, 4), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	
	local badge = Create("TextBox", {Size = UDim2.new(0, 48, 0, 22), Position = UDim2.new(1, -60, 0, 4), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.85, Text = tostring(default), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, ClearTextOnFocus = true, Parent = container}); badge:SetAttribute("OrigBT", 0.85); badge:SetAttribute("OrigTT", 0); Corner(badge, 6)
	
	local bar = Create("Frame", {Size = UDim2.new(1, -28, 0, 8), Position = UDim2.new(0, 14, 0, 36), BackgroundColor3 = TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); bar:SetAttribute("OrigBT", 0); Corner(bar, 4)
	local fill = Create("Frame", {Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = bar}); fill:SetAttribute("OrigBT", 0); Corner(fill, 4)
	
	local sliderDragging = false
	local currentVal = default
	
	local function update(pct)
		pct = math.clamp(pct, 0, 1)
		currentVal = math.floor(min + (max - min) * pct)
		fill.Size = UDim2.new(pct, 0, 1, 0)
		badge.Text = tostring(currentVal)
		callback(currentVal)
	end
	
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
	
	badge.FocusLost:Connect(function()
		local num = tonumber(badge.Text)
		if num then
			num = math.clamp(math.floor(num), min, max)
			local pct = (num - min) / (max - min)
			update(pct)
		else
			badge.Text = tostring(currentVal)
		end
	end)
	
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
	
	return {SetValue = function(v) local pct = (v - min) / (max - min); update(pct) end, GetValue = function() return currentVal end}
end

local function SliderCompact(parent, text, min, max, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 10)
	Create("TextLabel", {Size = UDim2.new(0.4, 0, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	
	local badge = Create("TextBox", {Size = UDim2.new(0, 44, 0, 22), Position = UDim2.new(1, -56, 0.5, -11), BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.85, Text = tostring(default), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 11, BorderSizePixel = 0, ClearTextOnFocus = true, Parent = container}); badge:SetAttribute("OrigBT", 0.85); badge:SetAttribute("OrigTT", 0); Corner(badge, 6)
	
	local bar = Create("Frame", {Size = UDim2.new(0.32, 0, 0, 6), Position = UDim2.new(0.42, 0, 0.5, -3), BackgroundColor3 = TC(S.Theme.ToggleOff), BorderSizePixel = 0, Parent = container}); bar:SetAttribute("OrigBT", 0); Corner(bar, 3)
	local fill = Create("Frame", {Size = UDim2.new(math.clamp((default - min) / (max - min), 0, 1), 0, 1, 0), BackgroundColor3 = TC(S.Theme.Accent), BorderSizePixel = 0, Parent = bar}); fill:SetAttribute("OrigBT", 0); Corner(fill, 3)
	
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
	
	badge.FocusLost:Connect(function()
		local num = tonumber(badge.Text)
		if num then
			num = math.clamp(math.floor(num), min, max)
			local pct = (num - min) / (max - min)
			update(pct)
		else
			badge.Text = tostring(currentVal)
		end
	end)
	
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.12) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.12) end)
	
	return {SetValue = function(v) local pct = (v - min) / (max - min); update(pct) end, GetValue = function() return currentVal end}
end

local function Button(parent, text, callback, danger, keybindName)
	local btn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = danger and Color3.fromRGB(45, 22, 22) or TC(S.Theme.Card), Text = "", BorderSizePixel = 0, Parent = parent}); btn:SetAttribute("OrigBT", 0); Corner(btn, 10)
	Create("TextLabel", {Size = UDim2.new(1, -36, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = danger and TC(S.Theme.Danger) or TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = btn}):SetAttribute("OrigTT", 0)
	local arrow = Create("TextLabel", {Size = UDim2.new(0, 18, 1, 0), Position = UDim2.new(1, -26, 0, 0), BackgroundTransparency = 1, Text = ">", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 20, Parent = btn}); arrow:SetAttribute("OrigTT", 0)
	btn.MouseEnter:Connect(function() tween(btn, {BackgroundColor3 = danger and Color3.fromRGB(65, 28, 28) or TC(S.Theme.CardHover)}, 0.12); tween(arrow, {Position = UDim2.new(1, -22, 0, 0)}, 0.15) end)
	btn.MouseLeave:Connect(function() tween(btn, {BackgroundColor3 = danger and Color3.fromRGB(45, 22, 22) or TC(S.Theme.Card)}, 0.12); tween(arrow, {Position = UDim2.new(1, -26, 0, 0)}, 0.15) end)
	btn.MouseButton1Click:Connect(callback)
	local kbName = keybindName or text:gsub("[^%w]", "")
	btn.MouseButton2Click:Connect(function() ShowKeybindPopup(kbName, function(key) RegisterKeybind(kbName, callback, key); UpdateKeybindPanel(); Notify(L("hub_name"), kbName .. " -> " .. key, 2) end) end)
	return btn
end

local function InfoCard(parent, text, copyable)
	local f = Create("Frame", {Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); f:SetAttribute("OrigBT", 0); Corner(f, 8)
	local l = Create("TextLabel", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = f}); l:SetAttribute("OrigTT", 0)
	if copyable then
		local cbtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = f})
		cbtn.MouseButton1Click:Connect(function() local val = text:match(": (.+)$") or text; CopyToClipboard(val); Notify(L("hub_name"), L("copied") .. " " .. val, 2); tween(f, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.1); task.delay(0.3, function() tween(f, {BackgroundColor3 = TC(S.Theme.Card)}, 0.2) end) end)
		cbtn.MouseEnter:Connect(function() tween(f, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
		cbtn.MouseLeave:Connect(function() tween(f, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
	end
	return f, l
end

-- Store dropdown references for updating on config load
local DropdownRefs = {}

local function Dropdown(parent, text, options, callback, refName)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, ClipsDescendants = true, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 10)
	Create("TextLabel", {Size = UDim2.new(0.48, 0, 0, 44), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local selected = Create("TextButton", {Size = UDim2.new(0.48, -14, 0, 30), Position = UDim2.new(0.52, 0, 0, 7), BackgroundColor3 = TC(S.Theme.CardHover), Text = options[1] or "-", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, AutoButtonColor = false, Parent = container}); selected:SetAttribute("OrigTT", 0); Corner(selected, 8)
	local arrow2 = Create("TextLabel", {Size = UDim2.new(0, 14, 1, 0), Position = UDim2.new(1, -18, 0, 0), BackgroundTransparency = 1, Text = "v", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 9, Parent = selected}); arrow2:SetAttribute("OrigTT", 0)
	local open = false
	
	local listFrame = Create("ScrollingFrame", {
		Size = UDim2.new(0.48, -14, 0, 0), 
		Position = UDim2.new(0.52, 0, 0, 40), 
		BackgroundColor3 = TC(S.Theme.CardHover), 
		BorderSizePixel = 0, 
		ClipsDescendants = true, 
		ScrollBarThickness = 0,
		ScrollBarImageColor3 = TC(S.Theme.Accent),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingEnabled = true,
		Visible = false,
		Parent = container
	})
	Corner(listFrame, 8)
	Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = listFrame}); Pad(listFrame, 4, 4, 4, 4)
	
	local function buildOptions(opts)
		for _, ch in pairs(listFrame:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
		for _, opt in ipairs(opts) do
			local ob = Create("TextButton", {Size = UDim2.new(1, 0, 0, 28), BackgroundColor3 = TC(S.Theme.Card), Text = opt, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 12, BorderSizePixel = 0, AutoButtonColor = false, Parent = listFrame}); Corner(ob, 6)
			ob.MouseEnter:Connect(function() tween(ob, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.1) end)
			ob.MouseLeave:Connect(function() tween(ob, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
			ob.MouseButton1Click:Connect(function() 
				selected.Text = opt
				open = false
				listFrame.Visible = false
				listFrame.ScrollBarThickness = 0
				tween(container, {Size = UDim2.new(1, 0, 0, 44)}, 0.2)
				tween(listFrame, {Size = UDim2.new(0.48, -14, 0, 0)}, 0.15)
				arrow2.Rotation = 0
				callback(opt) 
			end)
		end
	end
	buildOptions(options)
	
	selected.MouseButton1Click:Connect(function()
		open = not open
		local h = math.min(#options * 32 + 10, 150)
		if open then
			listFrame.Visible = true
			listFrame.ScrollBarThickness = 3
		end
		tween(container, {Size = UDim2.new(1, 0, 0, open and (44 + h) or 44)}, 0.25, Enum.EasingStyle.Quint)
		tween(listFrame, {Size = UDim2.new(0.48, -14, 0, open and h or 0)}, 0.2)
		tween(arrow2, {Rotation = open and 180 or 0}, 0.2)
		if not open then
			task.delay(0.2, function()
				listFrame.Visible = false
				listFrame.ScrollBarThickness = 0
			end)
		end
	end)
	selected.MouseEnter:Connect(function() tween(selected, {BackgroundColor3 = TC(S.Theme.Accent), BackgroundTransparency = 0.7}, 0.1) end)
	selected.MouseLeave:Connect(function() tween(selected, {BackgroundColor3 = TC(S.Theme.CardHover), BackgroundTransparency = 0}, 0.1) end)
	
	local ref = {Refresh = function(newOpts) options = newOpts; buildOptions(newOpts) end, SetSelected = function(val) selected.Text = val end, GetSelected = function() return selected.Text end}
	if refName then DropdownRefs[refName] = ref end
	return ref
end

local function ShowColorPickerPopup(title, default, onApply)
	pcall(function() CoreGui:FindFirstChild("NHColorPicker"):Destroy() end)
	
	local cpGui = Create("ScreenGui", {Name = "NHColorPicker", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
	pcall(ProtectGui, cpGui); cpGui.Parent = CoreGui

	local popup = Create("Frame", {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = TC(S.Theme.Bg),
		BorderSizePixel = 0,
		ZIndex = 201,
		Parent = cpGui
	})
	Corner(popup, 14)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 2, Parent = popup})
	
	tween(popup, {Size = UDim2.new(0, 300, 0, 380)}, 0.35, Enum.EasingStyle.Back)
	task.wait(0.1)

	Create("TextLabel", {Size = UDim2.new(1, -20, 0, 28), Position = UDim2.new(0, 10, 0, 8), BackgroundTransparency = 1, Text = title, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 202, Parent = popup})

	local currentH, currentS2, currentV = 0, 1, 1
	if default then
		currentH, currentS2, currentV = Color3.fromRGB(default[1], default[2], default[3]):ToHSV()
	end

	local paletteSize = 170
	local paletteFrame = Create("Frame", {Size = UDim2.new(0, paletteSize, 0, paletteSize), Position = UDim2.new(0, 10, 0, 42), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 202, ClipsDescendants = true, Parent = popup}); Corner(paletteFrame, 8)

	local hueOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromHSV(currentH, 1, 1), BorderSizePixel = 0, ZIndex = 203, Parent = paletteFrame})
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}), Parent = hueOverlay})

	local blackOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, ZIndex = 204, Parent = paletteFrame})
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))}), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)}), Rotation = 90, Parent = blackOverlay})

	local svCursor = Create("Frame", {Size = UDim2.new(0, 14, 0, 14), Position = UDim2.new(currentS2, -7, 1 - currentV, -7), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 206, Parent = paletteFrame})
	local svCursorInner = Create("Frame", {Size = UDim2.new(0, 12, 0, 12), Position = UDim2.new(0, 1, 0, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 207, Parent = svCursor}); Corner(svCursorInner, 6)
	Create("UIStroke", {Color = Color3.new(0, 0, 0), Thickness = 2, Parent = svCursorInner})

	local hueBarW = 18
	local hueBar = Create("Frame", {Size = UDim2.new(0, hueBarW, 0, paletteSize), Position = UDim2.new(0, 10 + paletteSize + 10, 0, 42), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 202, ClipsDescendants = true, Parent = popup}); Corner(hueBar, 6)

	local hueColors = {}
	for i = 0, 6 do table.insert(hueColors, ColorSequenceKeypoint.new(i / 6, Color3.fromHSV(i / 6, 1, 1))) end
	Create("UIGradient", {Color = ColorSequence.new(hueColors), Rotation = 90, Parent = hueBar})

	local hueCursor = Create("Frame", {Size = UDim2.new(1, 4, 0, 6), Position = UDim2.new(0, -2, currentH, -3), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 206, Parent = hueBar}); Corner(hueCursor, 3)
	Create("UIStroke", {Color = Color3.new(0, 0, 0), Thickness = 1.5, Parent = hueCursor})

	local preview = Create("Frame", {Size = UDim2.new(0, 70, 0, 70), Position = UDim2.new(0, 220, 0, 42), BackgroundColor3 = Color3.fromHSV(currentH, currentS2, currentV), BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(preview, 10)
	Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0.5, Parent = preview})

	local rgbY = 42 + paletteSize + 12
	local function makeRGBBox(label, xOff, defVal)
		Create("TextLabel", {Size = UDim2.new(0, 12, 0, 18), Position = UDim2.new(0, xOff, 0, rgbY), BackgroundTransparency = 1, Text = label, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 11, ZIndex = 202, Parent = popup})
		local box = Create("TextBox", {Size = UDim2.new(0, 42, 0, 24), Position = UDim2.new(0, xOff + 14, 0, rgbY - 3), BackgroundColor3 = TC(S.Theme.Card), Text = tostring(defVal), TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, ZIndex = 202, ClearTextOnFocus = false, Parent = popup}); Corner(box, 6)
		return box
	end
	local c = Color3.fromHSV(currentH, currentS2, currentV)
	local rBox = makeRGBBox("R", 10, math.floor(c.R * 255))
	local gBox = makeRGBBox("G", 76, math.floor(c.G * 255))
	local bBox = makeRGBBox("B", 142, math.floor(c.B * 255))

	Create("TextLabel", {Size = UDim2.new(0, 14, 0, 18), Position = UDim2.new(0, 200, 0, rgbY), BackgroundTransparency = 1, Text = "#", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 12, ZIndex = 202, Parent = popup})
	local hexBox = Create("TextBox", {Size = UDim2.new(0, 72, 0, 24), Position = UDim2.new(0, 216, 0, rgbY - 3), BackgroundColor3 = TC(S.Theme.Card), Text = string.format("%02X%02X%02X", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255)), TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, ZIndex = 202, ClearTextOnFocus = false, Parent = popup}); Corner(hexBox, 6)

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

	local presetY = rgbY + 32
	local presetColors = {{255,0,0},{255,127,0},{255,255,0},{0,255,0},{0,255,255},{0,127,255},{0,0,255},{127,0,255},{255,0,255},{255,255,255},{128,128,128},{0,0,0}}
	for i, pc in ipairs(presetColors) do
		local psw = Create("TextButton", {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(0, 10 + (i-1) * 24, 0, presetY), BackgroundColor3 = Color3.fromRGB(pc[1], pc[2], pc[3]), Text = "", BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(psw, 6)
		Create("UIStroke", {Color = Color3.new(1,1,1), Thickness = 1, Transparency = 0.7, Parent = psw})
		psw.MouseButton1Click:Connect(function() currentH, currentS2, currentV = Color3.fromRGB(pc[1], pc[2], pc[3]):ToHSV(); updateFromHSV() end)
	end

	local btnY = presetY + 30
	local applyBtn = Create("TextButton", {Size = UDim2.new(0.47, 0, 0, 32), Position = UDim2.new(0, 10, 0, btnY), BackgroundColor3 = TC(S.Theme.Accent), Text = L("apply"), TextColor3 = Color3.new(1,1,1), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(applyBtn, 10)
	local closeBtn = Create("TextButton", {Size = UDim2.new(0.47, 0, 0, 32), Position = UDim2.new(0.53, 0, 0, btnY), BackgroundColor3 = TC(S.Theme.Card), Text = L("cancel"), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 13, BorderSizePixel = 0, ZIndex = 202, Parent = popup}); Corner(closeBtn, 10)

	applyBtn.MouseButton1Click:Connect(function()
		local col = Color3.fromHSV(currentH, currentS2, currentV)
		local result = {math.floor(col.R * 255), math.floor(col.G * 255), math.floor(col.B * 255)}
		onApply(result)
		tween(popup, {Size = UDim2.new(0, 0, 0, 0)}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.3, function() cpGui:Destroy() end)
	end)
	applyBtn.MouseEnter:Connect(function() tween(applyBtn, {BackgroundTransparency = 0.2}, 0.1) end)
	applyBtn.MouseLeave:Connect(function() tween(applyBtn, {BackgroundTransparency = 0}, 0.1) end)
	
	closeBtn.MouseButton1Click:Connect(function()
		tween(popup, {Size = UDim2.new(0, 0, 0, 0)}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In)
		task.delay(0.3, function() cpGui:Destroy() end)
	end)
	closeBtn.MouseEnter:Connect(function() tween(closeBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
	closeBtn.MouseLeave:Connect(function() tween(closeBtn, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)

	do local dr, ds, sp
		popup.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then local ry = i.Position.Y - popup.AbsolutePosition.Y; if ry <= 36 then dr = true; ds = i.Position; sp = popup.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dr = false end end) end end end)
		UIS.InputChanged:Connect(function(i) if dr and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - ds; popup.Position = UDim2.new(0.5, d.X, 0.5, d.Y) end end)
	end
end

local function ColorPicker(parent, text, default, callback)
	local container = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = parent}); container:SetAttribute("OrigBT", 0); Corner(container, 10)
	Create("TextLabel", {Size = UDim2.new(0.65, 0, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = text, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = container}):SetAttribute("OrigTT", 0)
	local preview = Create("Frame", {Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -42, 0.5, -14), BackgroundColor3 = TC(default), BorderSizePixel = 0, Parent = container}); preview:SetAttribute("OrigBT", 0); Corner(preview, 8)
	Create("UIStroke", {Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 0.7, Parent = preview})

	local pickBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = container})
	pickBtn.MouseButton1Click:Connect(function()
		ShowColorPickerPopup(text, default, function(c) default = c; preview.BackgroundColor3 = TC(c); callback(c) end)
	end)
	container.MouseEnter:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
	container.MouseLeave:Connect(function() tween(container, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
end
-- ═══ SCREEN INFO GUI (SYNCED WITH THEME) ═══
local ScreenInfoGui = Create("ScreenGui", {Name = "NHScreenInfo", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, ScreenInfoGui); ScreenInfoGui.Parent = CoreGui

local FPSFrame = Create("Frame", {
	Size = UDim2.new(0, 90, 0, 28),
	Position = UDim2.new(0, 10, 0, 10),
	BackgroundColor3 = TC(S.Theme.Bg),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Visible = S.FPSCounter or false,
	Parent = ScreenInfoGui
})
Corner(FPSFrame, 8)
local FPSStroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = FPSFrame})
local FPSLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "FPS: 60",
	TextColor3 = TC(S.FPSColor or {255, 255, 255}),
	Font = Enum.Font.GothamBold,
	TextSize = 13,
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
			FPSFrame.Visible = true
		else
			FPSFrame.Visible = false
		end
		task.wait(0.1)
	end
end)

local CoordsFrame = Create("Frame", {
	Size = UDim2.new(0, 180, 0, 28),
	Position = UDim2.new(0, 10, 0, 44),
	BackgroundColor3 = TC(S.Theme.Bg),
	BackgroundTransparency = 0.2,
	BorderSizePixel = 0,
	Visible = S.Coordinates or false,
	Parent = ScreenInfoGui
})
Corner(CoordsFrame, 8)
local CoordsStroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = CoordsFrame})
local CoordsLabel = Create("TextLabel", {
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "X: 0 Y: 0 Z: 0",
	TextColor3 = TC(S.CoordsColor or {255, 255, 255}),
	Font = Enum.Font.GothamBold,
	TextSize = 11,
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
				CoordsFrame.Visible = true
			end)
		else
			CoordsFrame.Visible = false
		end
		task.wait(0.1)
	end
end)

-- Function to update screen info theme
local function UpdateScreenInfoTheme()
	FPSFrame.BackgroundColor3 = TC(S.Theme.Bg)
	FPSStroke.Color = TC(S.Theme.Accent)
	CoordsFrame.BackgroundColor3 = TC(S.Theme.Bg)
	CoordsStroke.Color = TC(S.Theme.Accent)
end

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
	
	Create("Frame", {Size = UDim2.new(0, thickness, 0, size), Position = UDim2.new(0.5, -thickness/2, 0.5, -size - gap), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Create("Frame", {Size = UDim2.new(0, thickness, 0, size), Position = UDim2.new(0.5, -thickness/2, 0.5, gap), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Create("Frame", {Size = UDim2.new(0, size, 0, thickness), Position = UDim2.new(0.5, -size - gap, 0.5, -thickness/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	Create("Frame", {Size = UDim2.new(0, size, 0, thickness), Position = UDim2.new(0.5, gap, 0.5, -thickness/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame})
	local dot = Create("Frame", {Size = UDim2.new(0, thickness + 2, 0, thickness + 2), Position = UDim2.new(0.5, -(thickness + 2)/2, 0.5, -(thickness + 2)/2), BackgroundColor3 = color, BorderSizePixel = 0, Parent = CrosshairFrame}); Corner(dot, (thickness + 2)/2)
end

if S.Crosshair then UpdateCrosshair() end

-- ═══ KEYBIND PANEL ═══
local KBPanelGui = Create("ScreenGui", {Name = "NHKeybindPanel", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
pcall(ProtectGui, KBPanelGui); KBPanelGui.Parent = CoreGui
local KBPanel = Create("Frame", {Size = UDim2.new(0, 220, 0, 60), Position = UDim2.new(0, 10, 0.5, -100), BackgroundColor3 = TC(S.Theme.Bg), BackgroundTransparency = 0.1, BorderSizePixel = 0, Visible = S.ShowKeybindPanel or false, Parent = KBPanelGui}); Corner(KBPanel, 12)
local KBPanelStroke = Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.5, Parent = KBPanel})
local KBPanelTitle = Create("TextLabel", {Size = UDim2.new(1, -10, 0, 22), Position = UDim2.new(0, 10, 0, 4), BackgroundTransparency = 1, Text = "Keybinds", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = KBPanel})
local KBList = Create("Frame", {Size = UDim2.new(1, -14, 1, -30), Position = UDim2.new(0, 7, 0, 26), BackgroundTransparency = 1, ClipsDescendants = true, Parent = KBPanel})
Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = KBList})

do
	local dragging, dStart, sPos
	KBPanel.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true; dStart = i.Position; sPos = KBPanel.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end) end end)
	UIS.InputChanged:Connect(function(i) if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then local d = i.Position - dStart; KBPanel.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y) end end)
end

function UpdateKeybindPanel()
	KBPanel.BackgroundColor3 = TC(S.Theme.Bg)
	KBPanelStroke.Color = TC(S.Theme.Accent)
	KBPanelTitle.TextColor3 = TC(S.Theme.Accent)
	for _, ch in pairs(KBList:GetChildren()) do if ch:IsA("TextLabel") then ch:Destroy() end end
	local count = 0
	local ah = string.format("%02x%02x%02x", S.Theme.Accent[1], S.Theme.Accent[2], S.Theme.Accent[3])
	for _, kb in ipairs(KeybindRegistry) do
		if kb.key and kb.key ~= "None" then
			count += 1
			local st = kb.enabled and L("on") or L("off")
			local sc = kb.enabled and Color3.fromRGB(80, 220, 100) or TC(S.Theme.SubText)
			local sh = string.format("%02x%02x%02x", math.floor(sc.R*255), math.floor(sc.G*255), math.floor(sc.B*255))
			local row = Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, RichText = true, Parent = KBList})
			row.Text = '<font color="#'..ah..'">[' .. kb.key .. ']</font> ' .. kb.name .. ' <font color="#'..sh..'">' .. st .. '</font>'
		end
	end
	local tmKey = S.Keybinds.ToggleMenu or "RightControl"
	if tmKey ~= "None" then
		count += 1
		Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Text = "[" .. tmKey .. "] Toggle Menu", TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, LayoutOrder = -1, Parent = KBList})
	end
	if count == 0 then
		Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Text = L("no_keybinds"), TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, Parent = KBList})
	end
	tween(KBPanel, {Size = UDim2.new(0, 220, 0, math.max(count * 18 + 36, 56))}, 0.2)
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

-- ═══ SPIN SYSTEM ═══
local spinConn = nil

local function StartSpin()
	if spinConn then spinConn:Disconnect() end
	pcall(function()
		local root = getRoot()
		local av = root:FindFirstChild("NHSpin")
		if not av then
			av = Instance.new("BodyAngularVelocity")
			av.Name = "NHSpin"
			av.MaxTorque = Vector3.new(0, math.huge, 0)
			av.Parent = root
		end
		av.AngularVelocity = Vector3.new(0, S.SpinSpeed, 0)
	end)
	
	spinConn = RunService.Heartbeat:Connect(function()
		if not S.Spin then return end
		pcall(function()
			local spin = getRoot():FindFirstChild("NHSpin")
			if spin then spin.AngularVelocity = Vector3.new(0, S.SpinSpeed, 0) end
		end)
	end)
end

local function StopSpin()
	if spinConn then spinConn:Disconnect(); spinConn = nil end
	pcall(function() getRoot():FindFirstChild("NHSpin"):Destroy() end)
end

-- ═══ THEME APPLY FUNCTION ═══
local function ApplyTheme()
	-- Main frame
	Main.BackgroundColor3 = TC(S.Theme.Bg)
	local mainStroke = Main:FindFirstChildOfClass("UIStroke")
	if mainStroke then mainStroke.Color = TC(S.Theme.Accent) end
	
	-- Sidebar
	Sidebar.BackgroundColor3 = TC(S.Theme.Sidebar)
	SidebarCover.BackgroundColor3 = TC(S.Theme.Sidebar)
	
	-- Avatar frame
	AvFrame.BackgroundColor3 = TC(S.Theme.Card)
	local avStroke = AvFrame:FindFirstChildOfClass("UIStroke")
	if avStroke then avStroke.Color = TC(S.Theme.Accent) end
	
	-- Update all tabs
	for key, btn in pairs(tabButtons) do
		local txtLbl = btn:FindFirstChildOfClass("TextLabel")
		if txtLbl then
			if activeTab == key then
				btn.BackgroundColor3 = TC(S.Theme.Accent)
				txtLbl.TextColor3 = Color3.new(1, 1, 1)
			else
				txtLbl.TextColor3 = TC(S.Theme.SubText)
			end
		end
	end
	
	-- Update particles color
	for _, lbl in pairs(activeParticles) do
		pcall(function()
			lbl.TextColor3 = TC(S.Theme.Accent)
		end)
	end
	
	-- Page title
	PageTitleLabel.TextColor3 = TC(S.Theme.Text)
	
	-- Close button
	CloseBtn.BackgroundColor3 = TC(S.Theme.Card)
	
	-- Min button
	MinBtn.BackgroundColor3 = TC(S.Theme.Card)
	
	-- Update keybind panel
	UpdateKeybindPanel()
	
	-- Update screen info theme
	UpdateScreenInfoTheme()
	
	SaveCurrentTheme()
end

-- ═══ PAGE: MOVEMENT ═══
do
	local p = tabPages["tab_movement"]
	
	Section(p, L("sect_fly"))
	
	local flyModes = {L("fly_mode_default"), L("fly_mode_swim"), L("fly_mode_noclip"), L("fly_mode_platform")}
	local flyModeMap = {
		[L("fly_mode_default")] = "Default",
		[L("fly_mode_swim")] = "Swim",
		[L("fly_mode_noclip")] = "Noclip",
		[L("fly_mode_platform")] = "Platform"
	}
	local flyModeMapReverse = {}
	for k, v in pairs(flyModeMap) do flyModeMapReverse[v] = k end
	
	local flyModeDD = Dropdown(p, L("fly_mode"), flyModes, function(val)
		S.FlyMode = flyModeMap[val] or "Default"
		if S.Fly then
			iyflyspeed = S.FlySpeed / 50
			StartFly(S.FlyMode)
		end
	end, "FlyMode")
	
	Toggle(p, L("fly"), S.Fly, function(on)
		S.Fly = on
		if on then
			iyflyspeed = S.FlySpeed / 50
			StartFly(S.FlyMode or "Default")
			Notify(L("hub_name"), L("fly_enabled"), 2)
		else
			StopAllFly()
		end
	end, "Fly")
	
	SliderCompact(p, L("fly_speed"), 10, 300, S.FlySpeed, function(v) 
		S.FlySpeed = v 
		iyflyspeed = v / 50
	end)
	
	Section(p, L("sect_walk"))
	Toggle(p, L("speed_override"), S.Speed, function(on) S.Speed = on; getHum().WalkSpeed = on and S.WalkSpeed or 16 end, "SpeedOverride")
	SliderCompact(p, L("walkspeed"), 0, 500, S.WalkSpeed, function(v) S.WalkSpeed = v; if S.Speed then pcall(function() getHum().WalkSpeed = v end) end end)
	Toggle(p, L("speed_loop"), S.SpeedLoop or false, function(on) S.SpeedLoop = on end, "SpeedLoop")
	
	Section(p, L("sect_jump"))
	Toggle(p, L("jump_override"), S.JumpBoost, function(on) S.JumpBoost = on; local h = getHum(); h.UseJumpPower = true; h.JumpPower = on and S.JumpPower or 50 end, "JumpOverride")
	SliderCompact(p, L("jumppower"), 0, 500, S.JumpPower, function(v) S.JumpPower = v; if S.JumpBoost then pcall(function() getHum().UseJumpPower = true; getHum().JumpPower = v end) end end)
	Toggle(p, L("jump_loop"), S.JumpLoop or false, function(on) S.JumpLoop = on end, "JumpLoop")
	
	Player.CharacterAdded:Connect(function(char)
		task.wait(0.5)
		pcall(function()
			local hum = char:WaitForChild("Humanoid", 5)
			if hum then
				if S.SpeedLoop and S.Speed then hum.WalkSpeed = S.WalkSpeed end
				if S.JumpLoop and S.JumpBoost then hum.UseJumpPower = true; hum.JumpPower = S.JumpPower end
			end
		end)
	end)
	
	Section(p, L("sect_infjump"))
	Toggle(p, L("inf_jump"), S.InfJump, function(on) S.InfJump = on end, "InfJump")
	UIS.JumpRequest:Connect(function() if S.InfJump then pcall(function() getHum():ChangeState(Enum.HumanoidStateType.Jumping) end) end end)
	
	Section(p, L("sect_noclip"))
	Toggle(p, L("noclip"), S.Noclip, function(on) S.Noclip = on end, "Noclip")
	RunService.Stepped:Connect(function() if S.Noclip then pcall(function() for _, p2 in pairs(getChar():GetDescendants()) do if p2:IsA("BasePart") then p2.CanCollide = false end end end) end end)
	
	Section(p, L("sect_fling"))
	
	local flingModes = {L("fling_mode_walk"), L("fling_mode_fly"), L("fling_mode_spin")}
	local flingModeMap = {
		[L("fling_mode_walk")] = "Walk",
		[L("fling_mode_fly")] = "Fly",
		[L("fling_mode_spin")] = "Spin"
	}
	local flingModeMapReverse = {}
	for k, v in pairs(flingModeMap) do flingModeMapReverse[v] = k end
	
	local flingModeDD = Dropdown(p, L("fling_mode"), flingModes, function(val)
		S.FlingMode = flingModeMap[val] or "Walk"
		if S.Fling then
			-- Restart fling with new mode
			if S.FlingMode == "Walk" then
				StopFlyFling()
				StopFlingIY()
				task.wait(0.1)
				StartFlingIY()
			elseif S.FlingMode == "Fly" then
				StopFlingIY()
				task.wait(0.1)
				StartFlyFling()
			elseif S.FlingMode == "Spin" then
				StopFlyFling()
				StopFlingIY()
				task.wait(0.1)
				StartFlingIY()
			end
		end
	end, "FlingMode")
	
	Toggle(p, L("fling"), S.Fling, function(on)
		S.Fling = on
		if on then
			Notify(L("hub_name"), L("fling_enabled"), 2)
			if S.FlingMode == "Walk" or S.FlingMode == "Spin" or not S.FlingMode then
				StartFlingIY()
			elseif S.FlingMode == "Fly" then
				StartFlyFling()
			end
		else
			StopFlingIY()
			StopFlyFling()
		end
	end, "Fling")
	SliderCompact(p, L("fling_power"), 100, 3000, S.FlingPower or 500, function(v) S.FlingPower = v end)
	
	Toggle(p, L("spin"), S.Spin, function(on)
		S.Spin = on
		if on then StartSpin() else StopSpin() end
	end, "Spin")
	SliderCompact(p, L("spin_speed"), 1, 100, S.SpinSpeed or 20, function(v) 
		S.SpinSpeed = v 
		pcall(function()
			local spin = getRoot():FindFirstChild("NHSpin")
			if spin then spin.AngularVelocity = Vector3.new(0, v, 0) end
		end)
	end)
	
	Section(p, L("sect_orbit"))
	
	local playerNames = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then table.insert(playerNames, plr.Name) end
	end
	if #playerNames == 0 then table.insert(playerNames, "-") end
	
	local orbitDD = Dropdown(p, L("select_player"), playerNames, function(val)
		S.OrbitTarget = val
	end, "OrbitTarget")
	
	Toggle(p, L("orbit_player"), S.OrbitPlayer, function(on)
		S.OrbitPlayer = on
		if on then StartOrbit() else StopOrbit() end
	end, "OrbitPlayer")
	
	SliderCompact(p, L("orbit_speed"), 1, 10, S.OrbitSpeed or 1, function(v) S.OrbitSpeed = v end)
	SliderCompact(p, L("orbit_distance"), 5, 50, S.OrbitDistance or 15, function(v) S.OrbitDistance = v end)
	
	Section(p, L("sect_teleport"))
	
	local tpPlayerNames = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then table.insert(tpPlayerNames, plr.Name) end
	end
	if #tpPlayerNames == 0 then table.insert(tpPlayerNames, "-") end
	
	local selectedTPPlayer = tpPlayerNames[1] or "-"
	
	local tpDD = Dropdown(p, L("select_player"), tpPlayerNames, function(val)
		selectedTPPlayer = val
	end, "TPPlayer")
	
	Button(p, L("teleport"), function()
		if selectedTPPlayer == "-" then return end
		local target = Players:FindFirstChild(selectedTPPlayer)
		if target and target.Character then
			local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
			if targetRoot then
				pcall(function()
					getRoot().CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
				end)
				Notify(L("hub_name"), L("teleported_to") .. " " .. selectedTPPlayer, 2)
			end
		end
	end)
	
	local function refreshPlayerLists()
		local names = {}
		for _, p2 in pairs(Players:GetPlayers()) do if p2 ~= Player then table.insert(names, p2.Name) end end
		if #names == 0 then table.insert(names, "-") end
		orbitDD.Refresh(names)
		tpDD.Refresh(names)
	end
	
	Players.PlayerAdded:Connect(function() task.wait(1); refreshPlayerLists() end)
	Players.PlayerRemoving:Connect(function() task.wait(0.5); refreshPlayerLists() end)
end

-- ═══ PAGE: VISUAL ═══
do
	local p = tabPages["tab_visual"]
	local espObjs, tracerObjs, boxObjs = {}, {}, {}
	local rainbowConn = nil
	
	clearESP = function()
		for _, v in pairs(espObjs) do pcall(function() v:Destroy() end) end
		espObjs = {}
		for _, v in pairs(tracerObjs) do pcall(function() v:Remove() end) end
		tracerObjs = {}
		for _, v in pairs(boxObjs) do pcall(function() v:Destroy() end) end
		boxObjs = {}
	end
	
	makeESP = function(plr)
		if plr == Player or not plr.Character then return end
		local hl = Instance.new("Highlight")
		hl.FillColor = TC(S.ESPColor)
		hl.OutlineColor = TC(S.ESPOutline)
		hl.FillTransparency = S.ESPFillTransparency
		hl.OutlineTransparency = 0
		hl.Adornee = plr.Character
		hl.Parent = Gui
		table.insert(espObjs, hl)
		
		if S.ESPShowName or S.ESPShowHealth then
			local bb = Instance.new("BillboardGui")
			bb.Size = UDim2.new(0, 200, 0, 50)
			bb.StudsOffset = Vector3.new(0, 3.5, 0)
			bb.AlwaysOnTop = true
			bb.Adornee = plr.Character:FindFirstChild("Head")
			bb.Parent = Gui
			table.insert(espObjs, bb)
			
			if S.ESPShowName then
				Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), BackgroundTransparency = 1, Text = plr.DisplayName .. " [" .. plr.Name .. "]", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold, TextSize = 14, TextStrokeTransparency = 0.4, Parent = bb})
			end
			if S.ESPShowHealth then
				local hum2 = plr.Character:FindFirstChildOfClass("Humanoid")
				if hum2 then
					Create("TextLabel", {Size = UDim2.new(1, 0, 0, 14), Position = UDim2.new(0, 0, 0, 18), BackgroundTransparency = 1, Text = math.floor(hum2.Health) .. " / " .. math.floor(hum2.MaxHealth), TextColor3 = Color3.fromRGB(100, 255, 100), Font = Enum.Font.GothamSemibold, TextSize = 12, TextStrokeTransparency = 0.4, Parent = bb})
				end
			end
		end
		
		if S.ESPBoxes then
			local r2 = plr.Character:FindFirstChild("HumanoidRootPart")
			if r2 then
				local box = Instance.new("BillboardGui")
				box.Size = UDim2.new(4, 0, 5.5, 0)
				box.AlwaysOnTop = true
				box.Adornee = r2
				box.Parent = Gui
				table.insert(boxObjs, box)
				local boxFrame = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = box})
				Create("UIStroke", {Color = TC(S.ESPColor), Thickness = 2, Transparency = 0.3, Parent = boxFrame})
			end
		end
	end
	
	refreshESP = function()
		clearESP()
		if not S.ESP then return end
		for _, plr in pairs(Players:GetPlayers()) do
			if plr.Character and plr ~= Player then
				if S.ESPTeamCheck and plr.Team == Player.Team then continue end
				local r2 = plr.Character:FindFirstChild("HumanoidRootPart")
				if r2 then
					local d = (getRoot().Position - r2.Position).Magnitude
					if d <= S.ESPDistance then makeESP(plr) end
				end
			end
		end
	end
	
	startRainbow = function()
		if rainbowConn then return end
		rainbowConn = RunService.Heartbeat:Connect(function()
			if not S.ESPRainbow or not S.ESP then
				if rainbowConn then rainbowConn:Disconnect(); rainbowConn = nil end
				return
			end
			local col = Color3.fromHSV((tick() % 5) / 5, 1, 1)
			for _, obj in pairs(espObjs) do
				pcall(function()
					if obj:IsA("Highlight") then
						obj.FillColor = col
						obj.OutlineColor = col
					end
				end)
			end
		end)
	end

	Section(p, L("sect_esp"))
	
	local espPreviewContainer = Create("Frame", {Size = UDim2.new(1, 0, 0, 140), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p})
	espPreviewContainer:SetAttribute("OrigBT", 0)
	Corner(espPreviewContainer, 10)
	
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 4), BackgroundTransparency = 1, Text = "[ " .. L("esp_preview") .. " ]", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 11, Parent = espPreviewContainer}):SetAttribute("OrigTT", 0)
	
	local previewArea = Create("Frame", {Size = UDim2.new(1, -16, 0, 108), Position = UDim2.new(0, 8, 0, 26), BackgroundColor3 = Color3.fromRGB(12, 12, 18), BorderSizePixel = 0, ClipsDescendants = true, Parent = espPreviewContainer})
	previewArea:SetAttribute("OrigBT", 0)
	Corner(previewArea, 8)
	
	local figure = Create("Frame", {Size = UDim2.new(0, 40, 0, 80), Position = UDim2.new(0.5, -20, 0.5, -40), BackgroundTransparency = 1, Parent = previewArea})
	local pHead = Create("Frame", {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(0.5, -8, 0, 0), BackgroundColor3 = Color3.fromRGB(70, 70, 90), BorderSizePixel = 0, Parent = figure}); pHead:SetAttribute("OrigBT", 0); Corner(pHead, 8)
	local pBody = Create("Frame", {Size = UDim2.new(0, 24, 0, 32), Position = UDim2.new(0.5, -12, 0, 18), BackgroundColor3 = Color3.fromRGB(70, 70, 90), BorderSizePixel = 0, Parent = figure}); pBody:SetAttribute("OrigBT", 0); Corner(pBody, 4)
	local pLegL = Create("Frame", {Size = UDim2.new(0, 10, 0, 26), Position = UDim2.new(0.5, -11, 0, 52), BackgroundColor3 = Color3.fromRGB(70, 70, 90), BorderSizePixel = 0, Parent = figure}); pLegL:SetAttribute("OrigBT", 0); Corner(pLegL, 3)
	local pLegR = Create("Frame", {Size = UDim2.new(0, 10, 0, 26), Position = UDim2.new(0.5, 1, 0, 52), BackgroundColor3 = Color3.fromRGB(70, 70, 90), BorderSizePixel = 0, Parent = figure}); pLegR:SetAttribute("OrigBT", 0); Corner(pLegR, 3)
	
	local espBoxOverlay = Create("Frame", {Size = UDim2.new(0, 50, 0, 88), Position = UDim2.new(0.5, -25, 0.5, -44), BackgroundTransparency = 1, BorderSizePixel = 0, Parent = previewArea})
	local espBoxStroke = Create("UIStroke", {Color = TC(S.ESPColor), Thickness = 2, Transparency = 0, Parent = espBoxOverlay})
	Corner(espBoxOverlay, 4)
	local fillOverlay = Create("Frame", {Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = TC(S.ESPColor), BackgroundTransparency = S.ESPFillTransparency, BorderSizePixel = 0, ZIndex = 0, Parent = espBoxOverlay}); fillOverlay:SetAttribute("OrigBT", S.ESPFillTransparency); Corner(fillOverlay, 4)
	local nameTag = Create("TextLabel", {Size = UDim2.new(0, 100, 0, 12), Position = UDim2.new(0.5, -50, 0, 4), BackgroundTransparency = 1, Text = "PlayerName", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold, TextSize = 10, TextStrokeTransparency = 0.3, Parent = previewArea}); nameTag:SetAttribute("OrigTT", 0)
	local healthTag = Create("TextLabel", {Size = UDim2.new(0, 60, 0, 10), Position = UDim2.new(0.5, -30, 0, 16), BackgroundTransparency = 1, Text = "100 / 100", TextColor3 = Color3.fromRGB(100, 255, 100), Font = Enum.Font.GothamSemibold, TextSize = 8, TextStrokeTransparency = 0.3, Parent = previewArea}); healthTag:SetAttribute("OrigTT", 0)
	local tracerLine = Create("Frame", {Size = UDim2.new(0, 2, 0, 20), Position = UDim2.new(0.5, -1, 1, -22), BackgroundColor3 = TC(S.ESPColor), BorderSizePixel = 0, Parent = previewArea}); tracerLine:SetAttribute("OrigBT", 0); Corner(tracerLine, 1)
	
	updateESPPreview = function()
		local col = TC(S.ESPColor)
		espBoxStroke.Color = col
		espBoxStroke.Transparency = S.ESPBoxes and 0 or 0.7
		fillOverlay.BackgroundColor3 = col
		fillOverlay.BackgroundTransparency = S.ESPFillTransparency
		tracerLine.BackgroundColor3 = col
		tracerLine.Visible = S.ESPTracers
		nameTag.Visible = S.ESPShowName
		healthTag.Visible = S.ESPShowHealth
	end
	
	task.spawn(function()
		while espPreviewContainer.Parent do
			if S.ESPRainbow then
				local col = Color3.fromHSV((tick() % 5) / 5, 1, 1)
				espBoxStroke.Color = col
				fillOverlay.BackgroundColor3 = col
				tracerLine.BackgroundColor3 = col
			end
			task.wait(0.05)
		end
	end)
	
	updateESPPreview()

	Toggle(p, L("esp"), S.ESP, function(on) S.ESP = on; refreshESP(); if on and S.ESPRainbow then startRainbow() end; updateESPPreview() end, "ESP")
	Toggle(p, L("esp_names"), S.ESPShowName, function(on) S.ESPShowName = on; refreshESP(); updateESPPreview() end)
	Toggle(p, L("esp_health"), S.ESPShowHealth, function(on) S.ESPShowHealth = on; refreshESP(); updateESPPreview() end)
	Toggle(p, L("esp_team"), S.ESPTeamCheck, function(on) S.ESPTeamCheck = on; refreshESP() end)
	Toggle(p, L("esp_boxes"), S.ESPBoxes, function(on) S.ESPBoxes = on; refreshESP(); updateESPPreview() end, "BoxESP")
	Toggle(p, L("esp_tracers"), S.ESPTracers, function(on) S.ESPTracers = on; refreshESP(); updateESPPreview() end, "Tracers")
	Toggle(p, L("esp_rainbow"), S.ESPRainbow, function(on) S.ESPRainbow = on; if on and S.ESP then startRainbow() else if rainbowConn then rainbowConn:Disconnect(); rainbowConn = nil end end; updateESPPreview() end, "RainbowESP")
	Slider(p, L("esp_dist"), 100, 5000, S.ESPDistance, function(v) S.ESPDistance = v end)
	Slider(p, L("esp_fill"), 0, 100, math.floor(S.ESPFillTransparency * 100), function(v) S.ESPFillTransparency = v / 100; refreshESP(); updateESPPreview() end)
	
	Toggle(p, L("chams"), S.Chams, function(on) S.Chams = on; RefreshChams() end, "Chams")
	ColorPicker(p, L("chams") .. " Color", S.ChamsColor or {255, 0, 0}, function(c) S.ChamsColor = c; RefreshChams() end)

	task.spawn(function() while Gui.Parent do if S.ESP then refreshESP() end; if S.Chams then RefreshChams() end; task.wait(3) end end)

	Section(p, L("sect_screen_info"))
	Toggle(p, L("fps_counter"), S.FPSCounter, function(on) S.FPSCounter = on; FPSFrame.Visible = on end, "FPSCounter")
	ColorPicker(p, L("fps_counter") .. " Color", S.FPSColor or {255, 255, 255}, function(c) S.FPSColor = c; FPSLabel.TextColor3 = TC(c) end)
	Toggle(p, L("coordinates"), S.Coordinates, function(on) S.Coordinates = on; CoordsFrame.Visible = on end, "Coordinates")
	ColorPicker(p, L("coordinates") .. " Color", S.CoordsColor or {255, 255, 255}, function(c) S.CoordsColor = c; CoordsLabel.TextColor3 = TC(c) end)
	Toggle(p, L("show_keybind_panel"), S.ShowKeybindPanel or false, function(on) S.ShowKeybindPanel = on; KBPanel.Visible = on end)
	
	Section(p, L("crosshair"))
	Toggle(p, L("crosshair"), S.Crosshair, function(on) S.Crosshair = on; UpdateCrosshair() end, "Crosshair")
	ColorPicker(p, L("crosshair_color"), S.CrosshairColor or {255, 255, 255}, function(c) S.CrosshairColor = c; UpdateCrosshair() end)
	SliderCompact(p, L("crosshair_size"), 5, 30, S.CrosshairSize or 10, function(v) S.CrosshairSize = v; UpdateCrosshair() end)
	SliderCompact(p, L("crosshair_thickness"), 1, 6, S.CrosshairThickness or 2, function(v) S.CrosshairThickness = v; UpdateCrosshair() end)

	Section(p, L("sect_camera"))
	Slider(p, L("fov_changer"), 30, 120, S.FOV or 70, function(v) S.FOV = v; pcall(function() workspace.CurrentCamera.FieldOfView = v end) end)
	Slider(p, L("max_zoom"), 10, 1000, S.MaxZoom or 128, function(v) S.MaxZoom = v; pcall(function() Player.CameraMaxZoomDistance = v end) end)
	Toggle(p, L("unlock_3rd_person"), S.Unlock3rdPerson or false, function(on)
		S.Unlock3rdPerson = on
		pcall(function()
			Player.DevEnableMouseLock = true
			Player.CameraMode = Enum.CameraMode.Classic
			Player.CameraMaxZoomDistance = S.MaxZoom or 128
			Player.CameraMinZoomDistance = 0.5
		end)
	end, "Unlock3rdPerson")

	Section(p, L("blur_background"))
	Toggle(p, L("blur_background"), S.BlurBackground or false, function(on) S.BlurBackground = on; UpdateBlurState(); SaveCurrentTheme() end, "BlurBackground")
	Slider(p, L("blur_size"), 0, 56, S.BlurSize or 24, function(v) S.BlurSize = v; UpdateBlurState(); SaveCurrentTheme() end)

	Section(p, L("sect_lighting"))
	Toggle(p, L("fullbright"), S.Fullbright, function(on)
		S.Fullbright = on
		if on then
			Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		else
			Lighting.Brightness = 1; Lighting.GlobalShadows = true
			Lighting.Ambient = Color3.fromRGB(127, 127, 127)
			Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
		end
	end, "Fullbright")
	
	Toggle(p, L("no_fog"), S.NoFog, function(on) S.NoFog = on; Lighting.FogStart = 0; Lighting.FogEnd = on and 9999999 or 1000 end, "NoFog")
	Slider(p, L("day_night_cycle"), 0, 24, S.DayNightTime or 14, function(v) S.DayNightTime = v; pcall(function() Lighting.ClockTime = v end) end)

	local savedLS = {}
	Toggle(p, L("anti_lag"), S.AntiLag, function(on)
		S.AntiLag = on
		if on then
			savedLS.GS = Lighting.GlobalShadows
			pcall(function() savedLS.T = Lighting.Technology end)
			pcall(function() Lighting.GlobalShadows = false; Lighting.Technology = Enum.Technology.Compatibility end)
			pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
		else
			pcall(function() Lighting.GlobalShadows = savedLS.GS or true; if savedLS.T then Lighting.Technology = savedLS.T end end)
			pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
		end
	end, "AntiLag")
end

-- ═══ PAGE: MISC ═══
do
	local p = tabPages["tab_misc"]
	
	Section(p, L("sect_player"))
	local stunConn, stunPos
	Toggle(p, L("stun"), false, function(on)
		if on then
			stunPos = getRoot().CFrame
			getHum().WalkSpeed = 0
			getHum().JumpPower = 0
			stunConn = RunService.Heartbeat:Connect(function()
				pcall(function()
					getRoot().CFrame = stunPos
					getRoot().AssemblyLinearVelocity = Vector3.zero
					getRoot().AssemblyAngularVelocity = Vector3.zero
				end)
			end)
		else
			if stunConn then stunConn:Disconnect() end
			pcall(function()
				getHum().WalkSpeed = S.Speed and S.WalkSpeed or 16
				getHum().JumpPower = S.JumpBoost and S.JumpPower or 50
			end)
		end
	end, "Stun")

	local ragdollConn
	Toggle(p, L("ragdoll"), false, function(on)
		S.Ragdoll = on
		if on then
			pcall(function()
				local char, hum = getChar(), getHum()
				hum:ChangeState(Enum.HumanoidStateType.Physics)
				for _, j in pairs(char:GetDescendants()) do
					if j:IsA("Motor6D") then
						local a0 = Instance.new("Attachment"); a0.Name = "NHRAtt"; a0.Parent = j.Part0; a0.CFrame = j.C0
						local a1 = Instance.new("Attachment"); a1.Name = "NHRAtt"; a1.Parent = j.Part1; a1.CFrame = j.C1
						local bs = Instance.new("BallSocketConstraint"); bs.Name = "NHRag"; bs.Attachment0 = a0; bs.Attachment1 = a1; bs.LimitsEnabled = true; bs.TwistLimitsEnabled = true; bs.UpperAngle = 90; bs.Parent = j.Parent
						j.Enabled = false; j:SetAttribute("NHR", true)
					end
				end
				ragdollConn = RunService.Heartbeat:Connect(function()
					if not S.Ragdoll then return end
					pcall(function() hum:ChangeState(Enum.HumanoidStateType.Physics) end)
				end)
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

	Section(p, L("sect_server"))
	Button(p, L("server_hop"), function()
		pcall(function()
			local d = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
			for _, sv in pairs(d.data) do
				if sv.id ~= game.JobId and sv.playing < sv.maxPlayers then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, sv.id, Player)
					break
				end
			end
		end)
	end)
	Button(p, L("rejoin"), function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Player) end)

	Section(p, L("performance"))
	Button(p, L("fps_unlimited"), function()
		pcall(function()
			if setfpscap then setfpscap(9999); Notify(L("hub_name"), L("fps_unlocked"), 3)
			elseif unlockfps then unlockfps(); Notify(L("hub_name"), L("fps_unlocked"), 3)
			else Notify(L("hub_name"), L("fps_unlocker_not_supported"), 4) end
		end)
	end)
	
	Slider(p, L("fps_cap"), 5, 360, S.FPSCap or 60, function(v)
		S.FPSCap = v
		pcall(function()
			if setfpscap then setfpscap(v) end
		end)
	end)

	Section(p, L("sect_tools"))
	Button(p, L("btools_all"), function()
		pcall(function()
			local bp = Player.Backpack
			Instance.new("HopperBin", bp).BinType = Enum.BinType.Hammer
			Instance.new("HopperBin", bp).BinType = Enum.BinType.Clone
			Instance.new("HopperBin", bp).BinType = Enum.BinType.Grab
		end)
		Notify(L("hub_name"), L("all_btools_given"), 2)
	end)
	Button(p, L("btools_delete"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = Enum.BinType.Hammer; h.Parent = Player.Backpack end); Notify(L("hub_name"), L("delete_tool_given"), 2) end)
	Button(p, L("btools_copy"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = Enum.BinType.Clone; h.Parent = Player.Backpack end); Notify(L("hub_name"), L("clone_tool_given"), 2) end)
	Button(p, L("btools_move"), function() pcall(function() local h = Instance.new("HopperBin"); h.BinType = Enum.BinType.Grab; h.Parent = Player.Backpack end); Notify(L("hub_name"), L("move_tool_given"), 2) end)
	Button(p, L("tp_tool"), function()
		local t = Instance.new("Tool"); t.Name = "TP Tool"; t.RequiresHandle = false; t.CanBeDropped = false; t.Parent = Player.Backpack
		t.Activated:Connect(function() pcall(function() getRoot().CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 4, 0)) end) end)
		Notify(L("hub_name"), L("tp_tool_given"), 2)
	end)

	Section(p, L("sect_inventory"))
	Button(p, L("give_all_tools"), function()
		local c = 0
		for _, obj in pairs(ReplicatedStorage:GetDescendants()) do
			if obj:IsA("Tool") then pcall(function() obj:Clone().Parent = Player.Backpack end); c += 1 end
		end
		Notify(L("hub_name"), string.format(L("unlocked_tools"), c), 3)
	end)
	Button(p, L("enable_inventory"), function() pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true) end) end)
	Button(p, L("enable_shiftlock"), function() pcall(function() Player.DevEnableMouseLock = true end) end)

	Section(p, L("sect_teleport"))
	Toggle(p, L("click_tp"), S.ClickTP, function(on) S.ClickTP = on end, "ClickTP")
	Mouse.Button1Down:Connect(function()
		if S.ClickTP and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
			pcall(function() getRoot().CFrame = CFrame.new(Mouse.Hit.Position + Vector3.new(0, 4, 0)) end)
		end
	end)

	Section(p, L("sect_scripts"))
	Button(p, L("open_iy"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end) end)
	Button(p, L("open_dex"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end) end)
	Button(p, L("open_spy"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))() end) end)
	Button(p, L("open_owl"), function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))() end) end)

	Section(p, L("sect_anti"))
	Toggle(p, L("anti_afk"), S.AntiAFK, function(on) S.AntiAFK = on end, "AntiAFK")
	Player.Idled:Connect(function()
		if S.AntiAFK then
			pcall(function()
				game:GetService("VirtualUser"):CaptureController()
				game:GetService("VirtualUser"):ClickButton2(Vector2.zero)
			end)
		end
	end)


	Section(p, L("sect_fun"))
	
	-- Fun Animation
	Button(p, L("fun_animation"), function()
		local char = getChar()
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then
			local rigType = hum.RigType
			if rigType == Enum.HumanoidRigType.R6 then
				Notify(L("hub_name"), L("rig_r6") .. " — " .. L("fun_animation_desc"), 3)
				pcall(function()
					loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
				end)
			else
				Notify(L("hub_name"), L("rig_r15") .. " — " .. L("fun_animation_desc"), 3)
				pcall(function()
					loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
				end)
			end
		end
	end)
	
	-- Drunk Walk
	drunkConn = nil
	Toggle(p, L("drunk"), false, function(on)
		if on then
			drunkConn = RunService.Heartbeat:Connect(function()
				pcall(function()
					local hum = getHum()
					local root = getRoot()
					if hum.MoveDirection.Magnitude > 0 then
						root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(math.random(-8, 8)), math.rad(math.random(-3, 3)))
					end
				end)
			end)
		else
			if drunkConn then drunkConn:Disconnect(); drunkConn = nil end
		end
	end, "Drunk")
	
	-- Sit
	Button(p, L("sit"), function()
		pcall(function() getHum().Sit = true end)
		Notify(L("hub_name"), L("sit") .. " ✓", 2)
	end)
	
	-- Jump Scare
	jumpScareNames = {}
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= Player then table.insert(jumpScareNames, plr.Name) end
	end
	if #jumpScareNames == 0 then table.insert(jumpScareNames, "-") end
	
	selectedJumpScare = jumpScareNames[1] or "-"
	jumpScarePlayerDD = Dropdown(p, L("select_player"), jumpScareNames, function(val)
		selectedJumpScare = val
	end, "JumpScarePlayer")
	
	Button(p, L("jump_scare"), function()
		if selectedJumpScare == "-" then return end
		local target = Players:FindFirstChild(selectedJumpScare)
		if target and target.Character then
			local targetHead = target.Character:FindFirstChild("Head")
			if targetHead then
				pcall(function() getRoot().CFrame = targetHead.CFrame * CFrame.new(0, 0, -2) end)
				Notify(L("hub_name"), L("jump_scare") .. " " .. selectedJumpScare .. "!", 2)
			end
		end
	end)
	
	-- Stare At Player
	stareConn = nil
	stareTarget = ""
	stareDD = Dropdown(p, L("stare_at"), jumpScareNames, function(val)
		stareTarget = val
	end, "StarePlayer")
	
	Toggle(p, L("stare_at"), false, function(on)
		if on then
			stareConn = RunService.RenderStepped:Connect(function()
				pcall(function()
					if stareTarget == "" or stareTarget == "-" then return end
					local target = Players:FindFirstChild(stareTarget)
					if target and target.Character then
						local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
						if targetRoot then
							local myRoot = getRoot()
							local lookAt = CFrame.lookAt(myRoot.Position, Vector3.new(targetRoot.Position.X, myRoot.Position.Y, targetRoot.Position.Z))
							myRoot.CFrame = lookAt
						end
					end
				end)
			end)
		else
			if stareConn then stareConn:Disconnect(); stareConn = nil end
		end
	end, "StareAt")
	
	-- Creepy Follow
	creepyFollowConn = nil
	creepyTarget = ""
	creepyDD = Dropdown(p, L("creepy_follow"), jumpScareNames, function(val)
		creepyTarget = val
	end, "CreepyPlayer")
	
	Toggle(p, L("creepy_follow"), false, function(on)
		if on then
			creepyFollowConn = RunService.Heartbeat:Connect(function()
				pcall(function()
					if creepyTarget == "" or creepyTarget == "-" then return end
					local target = Players:FindFirstChild(creepyTarget)
					if target and target.Character then
						local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
						if targetRoot then
							local myRoot = getRoot()
							local direction = (targetRoot.Position - myRoot.Position).Unit
							local distance = (targetRoot.Position - myRoot.Position).Magnitude
							if distance > 5 then
								myRoot.CFrame = myRoot.CFrame + direction * 0.15
							end
							local lookAt = CFrame.lookAt(myRoot.Position, Vector3.new(targetRoot.Position.X, myRoot.Position.Y, targetRoot.Position.Z))
							myRoot.CFrame = CFrame.new(myRoot.Position) * lookAt.Rotation
						end
					end
				end)
			end)
		else
			if creepyFollowConn then creepyFollowConn:Disconnect(); creepyFollowConn = nil end
		end
	end, "CreepyFollow")
	
	-- Dizzy
	dizzyConn = nil
	Toggle(p, L("dizzy"), false, function(on)
		if on then
			dizzyAngle = 0
			dizzyConn = RunService.RenderStepped:Connect(function(dt)
				pcall(function()
					dizzyAngle = dizzyAngle + dt * 5
					local root = getRoot()
					root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, dizzyAngle, 0)
				end)
			end)
		else
			if dizzyConn then dizzyConn:Disconnect(); dizzyConn = nil end
		end
	end, "Dizzy")
	
	-- Bunny Hop
	bunnyConn = nil
	Toggle(p, L("bunny_hop"), false, function(on)
		if on then
			bunnyConn = RunService.Heartbeat:Connect(function()
				pcall(function()
					local hum = getHum()
					if hum.FloorMaterial ~= Enum.Material.Air then
						hum:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end)
			end)
		else
			if bunnyConn then bunnyConn:Disconnect(); bunnyConn = nil end
		end
	end, "BunnyHop")
	
	-- Crab Walk
	crabConn = nil
	Toggle(p, L("crab_walk"), false, function(on)
		if on then
			crabConn = RunService.RenderStepped:Connect(function()
				pcall(function()
					local hum = getHum()
					local root = getRoot()
					if hum.MoveDirection.Magnitude > 0 then
						local sideDir = root.CFrame.RightVector
						root.CFrame = CFrame.lookAt(root.Position, root.Position + sideDir)
					end
				end)
			end)
		else
			if crabConn then crabConn:Disconnect(); crabConn = nil end
		end
	end, "CrabWalk")
	
	-- Moonwalk
	moonwalkConn = nil
	Toggle(p, L("moonwalk"), false, function(on)
		if on then
			moonwalkConn = RunService.RenderStepped:Connect(function()
				pcall(function()
					local hum = getHum()
					local root = getRoot()
					if hum.MoveDirection.Magnitude > 0 then
						local moveDir = hum.MoveDirection
						root.CFrame = CFrame.lookAt(root.Position, root.Position - moveDir)
					end
				end)
			end)
		else
			if moonwalkConn then moonwalkConn:Disconnect(); moonwalkConn = nil end
		end
	end, "Moonwalk")
	
	-- Earthquake
	earthquakeConn = nil
	Toggle(p, L("earthquake"), false, function(on)
		if on then
			earthquakeConn = RunService.RenderStepped:Connect(function()
				pcall(function()
					local cam = workspace.CurrentCamera
					local shake = Vector3.new(math.random(-100, 100) / 500, math.random(-100, 100) / 500, math.random(-100, 100) / 500)
					cam.CFrame = cam.CFrame * CFrame.new(shake)
				end)
			end)
		else
			if earthquakeConn then earthquakeConn:Disconnect(); earthquakeConn = nil end
		end
	end, "Earthquake")
	
	-- Flip
	Button(p, L("flip"), function()
		pcall(function()
			local root = getRoot()
			root.CFrame = root.CFrame * CFrame.Angles(math.rad(180), 0, 0)
		end)
		Notify(L("hub_name"), L("flip") .. " ✓", 2)
	end)
	
	-- Random TP
	Button(p, L("random_tp"), function()
		pcall(function()
			getRoot().CFrame = CFrame.new(math.random(-500, 500), 100, math.random(-500, 500))
		end)
		Notify(L("hub_name"), L("random_tp") .. " ✓", 2)
	end)
	
	-- Refresh player lists
	refreshFunPlayerLists = function()
		local names = {}
		for _, p2 in pairs(Players:GetPlayers()) do if p2 ~= Player then table.insert(names, p2.Name) end end
		if #names == 0 then table.insert(names, "-") end
		if jumpScarePlayerDD then jumpScarePlayerDD.Refresh(names) end
		if stareDD then stareDD.Refresh(names) end
		if creepyDD then creepyDD.Refresh(names) end
	end
	
	Players.PlayerAdded:Connect(function() task.wait(1); refreshFunPlayerLists() end)
	Players.PlayerRemoving:Connect(function() task.wait(0.5); refreshFunPlayerLists() end)
end

-- ═══ PAGE: SETTINGS ═══
do
	local p = tabPages["tab_settings"]

	Section(p, L("language"))
	local langOpts = {"EN - English", "RU - Русский", "JP - 日本語", "ES - Español"}
	local curLD = "EN - English"
	for _, o in ipairs(langOpts) do if o:sub(1, 2) == CurrentLang then curLD = o; break end end
	local langDD = Dropdown(p, L("select_lang"), langOpts, function(val)
		local code = val:sub(1, 2)
		CurrentLang = code; S.Language = code; SaveLanguage(code)
		Notify(L("hub_name"), L("language_changed") .. " " .. val .. "\n" .. L("reload_to_apply"), 4)
	end, "Language")
	langDD.SetSelected(curLD)

	Section(p, L("notification_style"))
	local notifStyles = {L("notif_style_modern"), L("notif_style_minimal"), L("notif_style_classic"), L("notif_style_gradient"), L("notif_style_neon"), L("notif_style_glass"), L("notif_style_cyber")}
	local notifStyleMap = {[L("notif_style_modern")] = "Modern", [L("notif_style_minimal")] = "Minimal", [L("notif_style_classic")] = "Classic", [L("notif_style_gradient")] = "Gradient", [L("notif_style_neon")] = "Neon", [L("notif_style_glass")] = "Glass", [L("notif_style_cyber")] = "Cyber"}
	local notifStyleMapReverse = {}; for k, v in pairs(notifStyleMap) do notifStyleMapReverse[v] = k end
	
	local notifDD = Dropdown(p, L("notification_style"), notifStyles, function(val) S.NotificationStyle = notifStyleMap[val] or "Modern"; SaveCurrentTheme(); Notify(L("hub_name"), L("style_changed") .. " " .. S.NotificationStyle, 2) end, "NotifStyle")
	if notifStyleMapReverse[S.NotificationStyle] then notifDD.SetSelected(notifStyleMapReverse[S.NotificationStyle]) end
	Button(p, L("test_notification"), function() Notify(L("hub_name"), L("test_notification") .. "!", 3) end)

	Section(p, L("keybinds"))
	InfoCard(p, L("right_click_hint"))

	local tmKeyC = Create("Frame", {Size = UDim2.new(1, 0, 0, 44), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); tmKeyC:SetAttribute("OrigBT", 0); Corner(tmKeyC, 10)
	Create("TextLabel", {Size = UDim2.new(0.52, 0, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = L("toggle_key"), TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = tmKeyC}):SetAttribute("OrigTT", 0)
	local tmKeyBtn = Create("TextButton", {Size = UDim2.new(0.44, -14, 0, 30), Position = UDim2.new(0.56, 0, 0.5, -15), BackgroundColor3 = TC(S.Theme.CardHover), Text = S.Keybinds.ToggleMenu or "RightControl", TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 12, BorderSizePixel = 0, Parent = tmKeyC}); tmKeyBtn:SetAttribute("OrigTT", 0); Corner(tmKeyBtn, 8)
	Create("UIStroke", {Color = TC(S.Theme.Accent), Thickness = 1, Transparency = 0.7, Parent = tmKeyBtn})
	
	local tmL = false
	tmKeyBtn.MouseButton1Click:Connect(function()
		if tmL then return end; tmL = true; tmKeyBtn.Text = L("press_key"); tween(tmKeyBtn, {BackgroundColor3 = TC(S.Theme.Accent)}, 0.15); tmKeyBtn.TextColor3 = Color3.new(1, 1, 1)
		local conn; conn = UIS.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Keyboard then S.Keybinds.ToggleMenu = input.KeyCode.Name; tmKeyBtn.Text = input.KeyCode.Name; tween(tmKeyBtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.15); tmKeyBtn.TextColor3 = TC(S.Theme.Accent); tmL = false; conn:Disconnect(); UpdateKeybindPanel() end
		end)
	end)
	tmKeyC.MouseEnter:Connect(function() tween(tmKeyC, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
	tmKeyC.MouseLeave:Connect(function() tween(tmKeyC, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)

	Button(p, L("clear_all_keybinds"), function()
		for _, kb in ipairs(KeybindRegistry) do kb.key = "None" end
		for k, _ in pairs(S.Keybinds) do if k ~= "ToggleMenu" then S.Keybinds[k] = "None" end end
		UpdateKeybindPanel(); Notify(L("hub_name"), L("keybinds_cleared"), 3)
	end, true)

	Section(p, L("configs"))
	local cfgIF = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); cfgIF:SetAttribute("OrigBT", 0); Corner(cfgIF, 10)
	local cfgBox = Create("TextBox", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, PlaceholderText = L("config_name"), PlaceholderColor3 = TC(S.Theme.SubText), Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = cfgIF}); cfgBox:SetAttribute("OrigTT", 0)
	
	local configList = GetConfigs()
	local autoLoadName = GetAutoLoad()
	
	local defaultConfigSelected = L("no_configs")
	if #configList > 0 then
		if autoLoadName ~= "" and table.find(configList, autoLoadName) then
			defaultConfigSelected = autoLoadName
			cfgBox.Text = autoLoadName
		else
			defaultConfigSelected = configList[1]
		end
	end
	
	local configDD = Dropdown(p, L("select_config"), #configList > 0 and configList or {L("no_configs")}, function(val) 
		if val ~= L("no_configs") then cfgBox.Text = val end 
	end, "ConfigSelect")
	if defaultConfigSelected ~= L("no_configs") then
		configDD.SetSelected(defaultConfigSelected)
	end
	
	-- Create Config button - checks for duplicates
	Button(p, L("create_config"), function()
		local n = cfgBox.Text
		if n == "" then Notify(L("hub_name"), L("enter_config_name"), 2); return end
		if ConfigExists(n) then
			Notify(L("hub_name"), L("config_exists"), 3)
			return
		end
		SaveConfig(n)
		local newList = GetConfigs()
		configDD.Refresh(#newList > 0 and newList or {L("no_configs")})
		Notify(L("hub_name"), "'" .. n .. "' " .. L("created"), 3)
	end)
	
	-- Save Config button - overwrites without checking
	Button(p, L("save_config"), function()
		local n = cfgBox.Text
		if n == "" then Notify(L("hub_name"), L("enter_config_name"), 2); return end
		SaveConfig(n)
		local newList = GetConfigs()
		configDD.Refresh(#newList > 0 and newList or {L("no_configs")})
		Notify(L("hub_name"), "'" .. n .. "' " .. L("saved"), 3)
	end)
	
	Button(p, L("load_config"), function()
		local n = cfgBox.Text
		if n == "" then Notify(L("hub_name"), L("select_or_enter_config"), 2); return end
		LoadConfig(n)
		ApplyTheme()
		
		-- Update dropdowns after config load
		if DropdownRefs["FlyMode"] and S.FlyMode then
			local flyModeMapReverse = {["Default"] = L("fly_mode_default"), ["Swim"] = L("fly_mode_swim"), ["Noclip"] = L("fly_mode_noclip"), ["Platform"] = L("fly_mode_platform")}
			if flyModeMapReverse[S.FlyMode] then
				DropdownRefs["FlyMode"].SetSelected(flyModeMapReverse[S.FlyMode])
			end
		end
		if DropdownRefs["FlingMode"] and S.FlingMode then
			local flingModeMapReverse = {["Walk"] = L("fling_mode_walk"), ["Fly"] = L("fling_mode_fly"), ["Spin"] = L("fling_mode_spin")}
			if flingModeMapReverse[S.FlingMode] then
				DropdownRefs["FlingMode"].SetSelected(flingModeMapReverse[S.FlingMode])
			end
		end
		if DropdownRefs["NotifStyle"] and S.NotificationStyle then
			local notifStyleMapReverse = {["Modern"] = L("notif_style_modern"), ["Minimal"] = L("notif_style_minimal"), ["Classic"] = L("notif_style_classic"), ["Gradient"] = L("notif_style_gradient"), ["Neon"] = L("notif_style_neon"), ["Glass"] = L("notif_style_glass"), ["Cyber"] = L("notif_style_cyber")}
			if notifStyleMapReverse[S.NotificationStyle] then
				DropdownRefs["NotifStyle"].SetSelected(notifStyleMapReverse[S.NotificationStyle])
			end
		end
		
		Notify(L("hub_name"), "'" .. n .. "' " .. L("loaded"), 3)
	end)
	
	Button(p, L("autoload_set"), function()
		local n = cfgBox.Text
		if n == "" then Notify(L("hub_name"), L("enter_config_name"), 2); return end
		SetAutoLoad(n)
		Notify(L("hub_name"), L("autoload_set_to") .. " '" .. n .. "'", 3)
	end)
	
	Button(p, L("delete_config"), function()
		local n = cfgBox.Text
		if n == "" then return end
		DeleteConfig(n)
		cfgBox.Text = ""
		local newList = GetConfigs()
		configDD.Refresh(#newList > 0 and newList or {L("no_configs")})
		Notify(L("hub_name"), "'" .. n .. "' " .. L("deleted"), 3)
	end, true)
	
	Button(p, L("refresh_configs"), function()
		local newList = GetConfigs()
		configDD.Refresh(#newList > 0 and newList or {L("no_configs")})
	end)

	Section(p, L("sect_danger"))
	Button(p, L("reload_menu"), function()
		Notify(L("hub_name"), L("reloading"), 2); SaveConfig("_reload_temp"); SaveCurrentTheme()
		local rURL = _G.NesficateHubSource; task.wait(0.3)
		pcall(function() Gui:Destroy() end); pcall(function() KBPanelGui:Destroy() end); pcall(function() ScreenInfoGui:Destroy() end)
		pcall(function() CrosshairGui:Destroy() end); pcall(function() NotificationGui:Destroy() end); pcall(function() if BlurEffect then BlurEffect.Size = 0 end end)
		task.wait(0.3); local ok = false
		if rURL and rURL ~= "" then ok = pcall(function() loadstring(game:HttpGet(rURL))() end) end
		if not ok then Notify("Neo's Hub", L("reload_fail"), 8) end
	end)
	Button(p, L("panic"), function() PanicUnload() end, true)
end

-- ═══ PAGE: THEMES ═══
do
	local p = tabPages["tab_themes"]

	Section(p, L("particles"))
	Toggle(p, L("particles"), S.ParticlesEnabled or false, function(on) 
		S.ParticlesEnabled = on
		if on then SpawnParticles() else ClearParticles() end
		SaveCurrentTheme() 
	end, "Particles")
	
	Slider(p, L("particles_size"), 6, 24, S.ParticleSize or 12, function(v) S.ParticleSize = v; SaveCurrentTheme() end)
	Slider(p, L("particles_amount"), 5, 40, S.ParticleAmount or 20, function(v) S.ParticleAmount = v; SaveCurrentTheme() end)

	Section(p, L("custom_themes"))
	local themeIF = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); themeIF:SetAttribute("OrigBT", 0); Corner(themeIF, 10)
	local themeBox = Create("TextBox", {Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 8, 0, 0), BackgroundTransparency = 1, PlaceholderText = L("theme_name"), PlaceholderColor3 = TC(S.Theme.SubText), Text = "", TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamSemibold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Parent = themeIF}); themeBox:SetAttribute("OrigTT", 0)
	
	local themeDD = Dropdown(p, L("select_theme"), GetThemes(), function(val) themeBox.Text = val end, "ThemeSelect")
	Button(p, L("save_theme"), function() local n = themeBox.Text; if n == "" then n = "MyTheme" end; SaveTheme(n); themeDD.Refresh(GetThemes()); Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("saved"), 3) end)
	Button(p, L("load_theme"), function() local n = themeBox.Text; if n == "" then return end; LoadTheme(n); ApplyTheme(); Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("loaded") .. "\n" .. L("reload_to_apply"), 3) end)
	Button(p, L("delete_theme"), function() local n = themeBox.Text; if n == "" then return end; DeleteTheme(n); themeBox.Text = ""; themeDD.Refresh(GetThemes()); Notify(L("hub_name"), "Theme '" .. n .. "' " .. L("deleted"), 3) end, true)

	Section(p, L("theme_editor"))
	ColorPicker(p, L("accent_color"), S.Theme.Accent, function(c) S.Theme.Accent = c; S.Theme.ToggleOn = c; ApplyTheme() end)
	ColorPicker(p, L("bg_color"), S.Theme.Bg, function(c) S.Theme.Bg = c; ApplyTheme() end)
	ColorPicker(p, L("sidebar_color"), S.Theme.Sidebar, function(c) S.Theme.Sidebar = c; ApplyTheme() end)
	ColorPicker(p, L("card_color"), S.Theme.Card, function(c) S.Theme.Card = c; ApplyTheme() end)
	ColorPicker(p, L("text_color"), S.Theme.Text, function(c) S.Theme.Text = c; ApplyTheme() end)
	ColorPicker(p, L("subtext_color"), S.Theme.SubText, function(c) S.Theme.SubText = c; ApplyTheme() end)

	Section(p, L("theme_presets"))
	local themes = {
		{"⚪ Default", {111, 90, 255}, {16, 16, 22}, {12, 12, 17}},
		{"💜 Purple", {111, 90, 255}, {16, 16, 22}, {12, 12, 17}}, 
		{"🌊 Ocean", {50, 150, 255}, {12, 18, 28}, {8, 14, 22}}, 
		{"❤️ Crimson", {220, 50, 50}, {24, 14, 14}, {18, 10, 10}}, 
		{"💚 Emerald", {50, 205, 100}, {12, 22, 16}, {8, 18, 12}}, 
		{"💛 Golden", {255, 190, 50}, {24, 22, 12}, {18, 16, 8}}, 
		{"💗 Pink", {255, 80, 180}, {24, 14, 22}, {18, 10, 18}}, 
		{"🧊 Arctic", {180, 200, 255}, {20, 22, 28}, {16, 18, 24}}, 
		{"🌙 Midnight", {100, 100, 180}, {8, 8, 14}, {4, 4, 10}}, 
		{"🌅 Sunset", {255, 120, 50}, {24, 16, 10}, {18, 12, 6}}, 
		{"💎 Cyan", {0, 220, 220}, {10, 22, 24}, {6, 18, 20}}
	}
	
	for _, td in ipairs(themes) do
		local name, accent, bg, sb = td[1], td[2], td[3], td[4]
		local tbtn = Create("TextButton", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = TC(S.Theme.Card), Text = "", BorderSizePixel = 0, Parent = p}); tbtn:SetAttribute("OrigBT", 0); Corner(tbtn, 10)
		local cprev = Create("Frame", {Size = UDim2.new(0, 26, 0, 26), Position = UDim2.new(0, 10, 0.5, -13), BackgroundColor3 = TC(accent), BorderSizePixel = 0, Parent = tbtn}); cprev:SetAttribute("OrigBT", 0); Corner(cprev, 13)
		Create("TextLabel", {Size = UDim2.new(1, -50, 1, 0), Position = UDim2.new(0, 44, 0, 0), BackgroundTransparency = 1, Text = name, TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = tbtn}):SetAttribute("OrigTT", 0)
		tbtn.MouseEnter:Connect(function() tween(tbtn, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
		tbtn.MouseLeave:Connect(function() tween(tbtn, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
		tbtn.MouseButton1Click:Connect(function() 
			if name == "⚪ Default" then
				-- Reset to default theme
				for k, v in pairs(DEFAULT_THEME) do
					S.Theme[k] = DeepCopy(v)
				end
			else
				S.Theme.Accent = accent
				S.Theme.ToggleOn = accent
				S.Theme.Bg = bg
				S.Theme.Sidebar = sb
				S.Theme.Card = {bg[1] + 10, bg[2] + 10, bg[3] + 14}
				S.Theme.CardHover = {bg[1] + 20, bg[2] + 20, bg[3] + 28}
			end
			ApplyTheme()
			Notify(L("hub_name"), L("theme_applied") .. ": " .. name .. "\n" .. L("reload_to_apply"), 3) 
		end)
	end
end

-- ═══ PAGE: CREDITS ═══
do
	local p = tabPages["tab_credits"]
	
	local banner = Create("Frame", {Size = UDim2.new(1, 0, 0, 100), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); banner:SetAttribute("OrigBT", 0); Corner(banner, 12)
	Create("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, TC(S.Theme.Accent)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(30, 25, 50)), ColorSequenceKeypoint.new(1, TC(S.Theme.Card))}), Rotation = 25, Parent = banner})
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 36), Position = UDim2.new(0, 0, 0, 12), BackgroundTransparency = 1, Text = "✨ Neo's Hub ✨", TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBlack, TextSize = 26, Parent = banner}):SetAttribute("OrigTT", 0)
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 48), BackgroundTransparency = 1, Text = L("version"), TextColor3 = Color3.fromRGB(200, 200, 220), Font = Enum.Font.GothamBold, TextSize = 13, Parent = banner}):SetAttribute("OrigTT", 0)
	Create("TextLabel", {Size = UDim2.new(1, 0, 0, 14), Position = UDim2.new(0, 0, 0, 70), BackgroundTransparency = 1, Text = L("made_with"), TextColor3 = Color3.fromRGB(160, 160, 180), Font = Enum.Font.GothamSemibold, TextSize = 11, Parent = banner}):SetAttribute("OrigTT", 0)

	Section(p, L("developer"))
	local links = {{"💬 Discord", "mrneoner"}, {"📱 Telegram", "@wantpepa"}, {"🐙 GitHub", "mrneoner1337"}, {"🎮 Roblox", "LegoSurgeon"}}
	for _, s2 in ipairs(links) do
		local card = Create("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, Parent = p}); card:SetAttribute("OrigBT", 0); Corner(card, 10)
		Create("TextLabel", {Size = UDim2.new(0.45, 0, 1, 0), Position = UDim2.new(0, 14, 0, 0), BackgroundTransparency = 1, Text = s2[1], TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamBold, TextSize = 13, TextXAlignment = Enum.TextXAlignment.Left, Parent = card}):SetAttribute("OrigTT", 0)
		Create("TextLabel", {Size = UDim2.new(0.5, -14, 1, 0), Position = UDim2.new(0.5, 0, 0, 0), BackgroundTransparency = 1, Text = s2[2], TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBold, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Right, Parent = card}):SetAttribute("OrigTT", 0)
		local clickBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = card})
		clickBtn.MouseEnter:Connect(function() tween(card, {BackgroundColor3 = TC(S.Theme.CardHover)}, 0.1) end)
		clickBtn.MouseLeave:Connect(function() tween(card, {BackgroundColor3 = TC(S.Theme.Card)}, 0.1) end)
		clickBtn.MouseButton1Click:Connect(function() CopyToClipboard(s2[2]); Notify(L("hub_name"), L("copied") .. " " .. s2[2], 2) end)
	end

	Section(p, L("changelog"))
	local changelogItems = {
		{"🎉 v3.0", "Major Update", {"Complete UI redesign", "Multi-language support", "Theme sync with notifications", "Teleport to player feature", "FPS slider 5-360", "Speed/Jump loop toggles", "Fling modes: Walk/Fly/Spin", "Blur fix", "Profile popup on avatar click"}},
		{"✨ v2.5", "Polish Update", {"Animated loading screen", "Keybind panel", "10 theme presets"}},
		{"🔄 v2.0", "Rewrite", {"Tab-based navigation", "Config system", "Theme foundation"}},
		{"🚀 v1.0", "Initial Release", {"Basic features"}}
	}
	
	for _, ver in ipairs(changelogItems) do
		local verFrame = Create("Frame", {Size = UDim2.new(1, 0, 0, 0), BackgroundColor3 = TC(S.Theme.Card), BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.Y, Parent = p}); verFrame:SetAttribute("OrigBT", 0); Corner(verFrame, 10)
		local header = Create("Frame", {Size = UDim2.new(1, 0, 0, 36), BackgroundTransparency = 1, Parent = verFrame})
		Create("TextLabel", {Size = UDim2.new(0, 80, 1, 0), Position = UDim2.new(0, 10, 0, 0), BackgroundTransparency = 1, Text = ver[1], TextColor3 = TC(S.Theme.Accent), Font = Enum.Font.GothamBlack, TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Parent = header}):SetAttribute("OrigTT", 0)
		Create("TextLabel", {Size = UDim2.new(1, -100, 1, 0), Position = UDim2.new(0, 90, 0, 0), BackgroundTransparency = 1, Text = ver[2], TextColor3 = TC(S.Theme.Text), Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, Parent = header}):SetAttribute("OrigTT", 0)
		local contentFrame = Create("Frame", {Size = UDim2.new(1, -20, 0, 0), Position = UDim2.new(0, 10, 0, 36), BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.Y, Parent = verFrame})
		Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = contentFrame})
		for _, item in ipairs(ver[3]) do Create("TextLabel", {Size = UDim2.new(1, 0, 0, 16), BackgroundTransparency = 1, Text = "• " .. item, TextColor3 = TC(S.Theme.SubText), Font = Enum.Font.GothamSemibold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, AutomaticSize = Enum.AutomaticSize.Y, Parent = contentFrame}):SetAttribute("OrigTT", 0) end
		Create("Frame", {Size = UDim2.new(1, 0, 0, 8), BackgroundTransparency = 1, Parent = contentFrame})
	end

	Section(p, L("disclaimer"))
	InfoCard(p, L("disc_text1"))
	InfoCard(p, L("disc_text2"))
end

-- ═══ APPLY AUTOLOAD (FIXED - ACTUALLY START FEATURES) ═══
task.defer(function()
	local al = GetAutoLoad()
	if al ~= "" and al ~= "_reload_temp" then
		task.wait(0.5) -- Wait for UI to be ready
		
		-- Set toggle states AND actually start the features
		if S.Fly then
			if ToggleRefs["Fly"] then ToggleRefs["Fly"].Set(true) end
			iyflyspeed = S.FlySpeed / 50
			sFLY()
			S.Noclip = true
			if ToggleRefs["Noclip"] then ToggleRefs["Noclip"].Set(true) end
		end
		
		if S.Fling then
			if ToggleRefs["Fling"] then ToggleRefs["Fling"].Set(true) end
			if S.FlingMode == "Walk" or S.FlingMode == "Spin" or not S.FlingMode then
				StartFlingIY()
			elseif S.FlingMode == "Fly" then
				StartFlyFling()
			end
		end
		
		if S.Spin then
			if ToggleRefs["Spin"] then ToggleRefs["Spin"].Set(true) end
			StartSpin()
		end
		
		if S.OrbitPlayer and S.OrbitTarget ~= "" then
			if ToggleRefs["OrbitPlayer"] then ToggleRefs["OrbitPlayer"].Set(true) end
			StartOrbit()
		end
		
		if S.Speed then
			if ToggleRefs["SpeedOverride"] then ToggleRefs["SpeedOverride"].Set(true) end
			pcall(function() getHum().WalkSpeed = S.WalkSpeed end)
		end
		
		if S.JumpBoost then
			if ToggleRefs["JumpOverride"] then ToggleRefs["JumpOverride"].Set(true) end
			pcall(function() getHum().UseJumpPower = true; getHum().JumpPower = S.JumpPower end)
		end
		
		if S.InfJump then
			if ToggleRefs["InfJump"] then ToggleRefs["InfJump"].Set(true) end
		end
		
		if S.Noclip then
			if ToggleRefs["Noclip"] then ToggleRefs["Noclip"].Set(true) end
		end
		
		if S.ESP then
			if ToggleRefs["ESP"] then ToggleRefs["ESP"].Set(true) end
		end
		
		if S.Fullbright then
			if ToggleRefs["Fullbright"] then ToggleRefs["Fullbright"].Set(true) end
			Lighting.Brightness = 2; Lighting.ClockTime = 14; Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(1, 1, 1)
			Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
		end
		
		if S.NoFog then
			if ToggleRefs["NoFog"] then ToggleRefs["NoFog"].Set(true) end
			Lighting.FogStart = 0; Lighting.FogEnd = 9999999
		end
		
		if S.Chams then
			if ToggleRefs["Chams"] then ToggleRefs["Chams"].Set(true) end
			RefreshChams()
		end
		
		if S.Crosshair then
			if ToggleRefs["Crosshair"] then ToggleRefs["Crosshair"].Set(true) end
			UpdateCrosshair()
		end
		
		-- Update visual elements
		UpdateKeybindPanel()
		FPSFrame.Visible = S.FPSCounter
		CoordsFrame.Visible = S.Coordinates
		KBPanel.Visible = S.ShowKeybindPanel
		
		-- Update dropdowns after autoload
		if DropdownRefs["FlyMode"] and S.FlyMode then
			local flyModeMapReverse = {["Default"] = L("fly_mode_default"), ["Swim"] = L("fly_mode_swim"), ["Noclip"] = L("fly_mode_noclip"), ["Platform"] = L("fly_mode_platform")}
			if flyModeMapReverse[S.FlyMode] then
				DropdownRefs["FlyMode"].SetSelected(flyModeMapReverse[S.FlyMode])
			end
		end
		if DropdownRefs["FlingMode"] and S.FlingMode then
			local flingModeMapReverse = {["Walk"] = L("fling_mode_walk"), ["Fly"] = L("fling_mode_fly"), ["Spin"] = L("fling_mode_spin")}
			if flingModeMapReverse[S.FlingMode] then
				DropdownRefs["FlingMode"].SetSelected(flingModeMapReverse[S.FlingMode])
			end
		end
	end
	
	if S.ParticlesEnabled then SpawnParticles() end
	
	-- Apply theme from config
	ApplyTheme()
end)

-- ═══ TOGGLE VISIBILITY + KEYBINDS ═══
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
	if isToggling then return end
	
	local keyName = input.KeyCode.Name
	local toggleKey = S.Keybinds.ToggleMenu or "RightControl"

	if keyName == toggleKey or (toggleKey == "RightControl" and input.KeyCode == Enum.KeyCode.RightControl) or input.KeyCode == Enum.KeyCode.Insert then
		isToggling = true
		guiVis = not guiVis
		
		if guiVis then
			Main.Visible = true
			if S.BlurBackground then ShowBlurImmediate() end
			if minimized then tween(Main, {Size = minSize}, 0.4, Enum.EasingStyle.Back)
			else tween(Main, {Size = UDim2.new(0, currentWidth, 0, currentHeight)}, 0.4, Enum.EasingStyle.Back) end
			task.delay(0.4, function() isToggling = false end)
		else
			SaveCurrentTheme()
			HideBlurImmediate()
			tween(Main, {Size = UDim2.new(0, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
			task.delay(0.35, function() Main.Visible = false; isToggling = false end)
		end
		return
	end
	
	for _, kb in ipairs(KeybindRegistry) do
		if kb.key and kb.key ~= "None" and keyName == kb.key then pcall(kb.callback); return end
	end
end)

task.defer(function() pcall(function() workspace.CurrentCamera.FieldOfView = S.FOV or 70; Player.CameraMaxZoomDistance = S.MaxZoom or 128 end) end)

game:BindToClose(function() SaveCurrentTheme() end)

task.wait(0.5)

-- Start directly with Movement tab
SwitchTab("tab_movement")

if S.BlurBackground then ShowBlurImmediate() end

Notify("Neo's Hub v3.0", string.format(L("toggle_hint"), S.Keybinds.ToggleMenu or "RightControl") .. "\n" .. L("right_click_hint"), 6)

print("======================================")
print(" Neo's Hub v3.0 - Loaded!")
print(" @mrneoner | Discord: mrneoner")
print(" Telegram: wantpepa")
print(" GitHub: mrneoner1337")
print(" Roblox: LegoSurgeon")
print("======================================")
