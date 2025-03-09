module WCL

  FALSE = 0
  TRUE  = 1

  CHANNEL_MESSAGE_HEADER_SIZE    = 12
  MAX_PATH                       = 260
  MAX_USER_NAME                  = 28
  MAX_LANGUAGE_SUBCOMMAND_CHARS  = 100
  MAX_MENU_ITEMS                 = 40
  MAX_CHANNEL_MESSAGE_SIZE       = 500
  MAX_FILE_LONGDESC_LINES        = 15
  NUM_USER_SECURITY              = 10
  SIZE_BBSNAME                   = 52
  SIZE_CITY                      = 32
  SIZE_PHONE                     = 28
  SIZE_FIRSTCALL                 = 28
  SIZE_PACKETID                  = 12
  SIZE_REGSTRING                 = 8
  SIZE_EXTENSION                 = 4
  SIZE_SHORT_FILE_NAME           = 16
  SIZE_LONG_FILE_NAME            = MAX_PATH
  SIZE_ATTACH_FILE_NAME          = 80
  SIZE_PROGRAM_NAME              = 64
  SIZE_DOMAIN_NAME               = 64
  SIZE_COMPUTER_NAME             = 16
  SIZE_CONFERENCE_NAME           = 60
  SIZE_CONFERENCE_ECHOTAG        = 64
  SIZE_CONFERENCEGROUP_NAME      = 32
  SIZE_FILEAREA_NAME             = 32
  SIZE_FILEGROUP_NAME            = 32
  SIZE_DOOR_NAME                 = 40
  SIZE_LANGUAGE_NAME             = 12
  SIZE_LANGUAGE_DESCRIPTION      = 72
  SIZE_MODEM_NAME                = 32
  SIZE_MODEM_STRING              = 64
  SIZE_NODECONFIG_PORTNAME       = 16
  SIZE_NODECONFIG_COMPUTER       = 16
  SIZE_SERVICE_NAME              = 64
  SIZE_SERVERSTATE_PORT          = 80
  SIZE_USER_TITLE                = 12
  SIZE_USER_NAME                 = 72
  SIZE_USER_PHONE                = 16
  SIZE_USER_FROM                 = 32
  SIZE_USER_ADDRESS              = 32
  SIZE_USER_STATE                = 16
  SIZE_USER_ZIP                  = 12
  SIZE_SECURITY_NAME             = 24
  SIZE_PASSWORD                  = 32
  SIZE_MENUITEM_COMMAND          = 48
  SIZE_MENUITEM_DESCRIPTION      = 32
  SIZE_MENUITEM_SELECTION        = 16
  SIZE_MENU_DESCRIPTION          = 40
  SIZE_CALLTYPE                  = 32
  SIZE_ENCODED_PASSWORD          = 20
  SIZE_FILE_DESCRIPTION          = 76
  SIZE_FILE_LONGDESC             = 80
  SIZE_MAKEWILD_BBSNAME          = 52
  SIZE_MAKEWILD_CITY             = 32
  SIZE_MAKEWILD_FIRSTCALL        = 28
  SIZE_MAKEWILD_PACKETID         = 12
  SIZE_MAKEWILD_PHONE            = 28
  SIZE_MAKEWILD_REGSTRING        = 8
  SIZE_MESSAGE_NETWORK           = 12
  SIZE_MESSAGE_SUBJECT           = 72
  SIZE_NODEINFO_ACTIVITY         = 32
  SIZE_NODEINFO_LASTCALLER       = 48
  SIZE_NODEINFO_SPEED            = 8
  SIZE_SASL_NAME                 = 32
  SIZE_SYSTEMPAGE_LINES          = 3
  SIZE_SYSTEMPAGE_TEXT           = 80
  SIZE_VOLUME_NAME               = 16

  

  @[Extern]
  record WHANDLE, unused : Int32

  alias WCHANDLE = WHANDLE*

  @[Extern]
  record FILETIME,
    dwLowDateTime : LibC::DWORD,
    dwHighDateTime : LibC::DWORD

  @[Extern]
  record SYSTEMTIME,
    wYear : UInt16,
    wMonth : UInt16,
    wDayOfWeek : UInt16,
    wDay : UInt16,
    wHour : UInt16,
    wMinute : UInt16,
    wSecond : UInt16,
    wMilliseconds : UInt16 do
  end

  @[Extern]
  record Win32FindData,
    dwFileAttributes : LibC::DWORD,
    ftCreationTime : FILETIME,
    ftLastAccessTime : FILETIME,
    ftLastWriteTime : FILETIME,
    nFileSizeHigh : LibC::DWORD,
    nFileSizeLow : LibC::DWORD,
    dwReserved0 : LibC::DWORD,
    dwReserved1 : LibC::DWORD,
    cFileName : LibC::Char[MAX_PATH],
    cAlternateFileName : LibC::Char[14] do
  end

  alias Win32FindDataA = Win32FindData

  @[Extern]
  record ObjectName,
    status : LibC::DWORD,
    objectId : LibC::DWORD,
    number : LibC::DWORD,
    name : LibC::Char[MAX_PATH] do
  end

  @[Extern]
  record WildcatTimeouts,
    version : LibC::WORD,
    revision : LibC::WORD,
    web : LibC::DWORD,
    web_ques : LibC::DWORD,
    telnet : LibC::DWORD,
    telnet_login : LibC::DWORD,
    ftp : LibC::DWORD,
    ppp : LibC::DWORD,
    nav : LibC::DWORD,
    pop3 : LibC::DWORD,
    pop3_login : LibC::DWORD,
    ftp_login : LibC::DWORD,
    ftp_data : LibC::DWORD,
    reserved : LibC::Char[76] do
  end

  enum WildcatLogPeriod
    None = 0
    Hourly = 1
    Daily = 2
    Weekly = 3
    Monthly = 4
    Unlimited = 5
    MaxSize = 6
  end

  @[Extern]
  record WildcatLogOptions,
    enable_session_trace : LibC::BOOL,
    log_period : WildcatLogPeriod,
    max_size : LibC::DWORD,
    verbosity : LibC::DWORD,
    reserved : LibC::BYTE[16] do
  end

  @[Extern]
  record HTTPAuthOptions,
    allow_plain_text : LibC::BOOL,
    allow_plain_text_with_ssl : LibC::BOOL,
    allow_plain_md5 : LibC::BOOL,
    allow_digest : LibC::BOOL,
    allow_challenge : LibC::BOOL,
    require_ssl : LibC::BOOL do
  end

  @[Extern]
  record WildcatHTTPD,
    version : LibC::WORD,
    revision : LibC::WORD,
    common_log_file : LibC::BOOL,
    deutsch_ivw : LibC::BOOL,
    log_options : WildcatLogOptions,
    options : LibC::DWORD,
    maximum_band_width : LibC::DWORD,
    send_buffer_size_1k : LibC::DWORD,
    rcvd_buffer_size_1k : LibC::DWORD,
    track_performance : LibC::BOOL,
    http_auth : HTTPAuthOptions,
    enable_pci_session : LibC::BOOL,
    reserved : LibC::Char[20] do
  end

  @[Extern]
  record WildcatSMTP,
    version : LibC::WORD,
    revision : LibC::WORD,
    port : LibC::DWORD,
    send_threads : LibC::WORD,
    accept_threads : LibC::WORD,
    options : LibC::DWORD,
    accept_only : LibC::BOOL,
    retries : LibC::DWORD,
    retry_wait : LibC::DWORD,
    smart_host : LibC::Char[52],
    size_limit : LibC::DWORD,
    local_only : LibC::BOOL,
    mapsrbl : LibC::BOOL,
    mapsrbl_server : LibC::Char[52],
    esmtp : LibC::BOOL,
    req_auth : LibC::BOOL,
    vrfy : LibC::BOOL,
    allow_relay : LibC::BOOL,
    check_rcpt : LibC::BOOL,
    enable_bad_filter : LibC::BOOL,
    require_mx : LibC::BOOL,
    require_host_match : LibC::BOOL do
  end

  @[Extern]
  record WildcatNNTP,
    version : LibC::WORD,
    revision : LibC::WORD,
    port : LibC::DWORD,
    options : LibC::DWORD,
    max_cross_post : LibC::DWORD,
    log_options : WildcatLogOptions,
    reserved : LibC::Char[80] do
  end

  @[Extern]
  record WildcatPOP3,
    version : LibC::WORD,
    revision : LibC::WORD,
    enable_pop_before_smtp : LibC::BOOL,
    pop_before_smtp_timeout : LibC::DWORD,
    options : LibC::DWORD,
    log_options : WildcatLogOptions,
    maximum_band_width : LibC::DWORD,
    send_buffer_size_1k : LibC::DWORD,
    rcvd_buffer_size_1k : LibC::DWORD,
    track_performance : LibC::BOOL,
    reserved : LibC::Char[64] do
  end

  @[Extern]
  record WildcatTelnet,
    version : LibC::WORD,
    revision : LibC::WORD,
    options : LibC::DWORD,
    log_options : WildcatLogOptions,
    maximum_band_width : LibC::DWORD,
    send_buffer_size_1k : LibC::DWORD,
    rcvd_buffer_size_1k : LibC::DWORD,
    track_performance : LibC::BOOL,
    reserved : LibC::Char[72] do
  end

  enum FtpListTextFormat
    UnixFormat = 0
    MSDOSFormat = 1
  end

  @[Extern]
  record WildcatFTP,
    version : LibC::WORD,
    revision : LibC::WORD,
    allow_anonymous : LibC::BOOL,
    show_file_groups : LibC::BOOL,
    use_under_score : LibC::BOOL,
    use_single_area_change : LibC::BOOL,
    max_anonymous_connects : LibC::DWORD,
    log_options : WildcatLogOptions,
    list_format : FtpListTextFormat,
    options : LibC::DWORD,
    maximum_band_width : LibC::DWORD,
    send_buffer_size_1k : LibC::DWORD,
    rcvd_buffer_size_1k : LibC::DWORD,
    track_performance : LibC::BOOL,
    max_connects : LibC::DWORD,
    reserved : LibC::Char[44] do
  end

  @[Extern]
  record MakeWild,
    version : LibC::DWORD,
    bbs_name : LibC::Char[SIZE_BBSNAME],
    sysop_name : LibC::Char[MAX_USER_NAME],
    city : LibC::Char[SIZE_CITY],
    phone : LibC::Char[SIZE_PHONE],
    first_call : LibC::Char[SIZE_FIRSTCALL],
    packet_id : LibC::Char[SIZE_PACKETID],
    reg_string : LibC::Char[SIZE_REGSTRING],
    system_access : LibC::DWORD,
    max_login_attempts : LibC::DWORD,
    free_form_phone : LibC::BOOL,
    hide_anon_ftp_password : LibC::BOOL,
    logon_language_prompt : LibC::BOOL,
    assume_8n1 : LibC::BOOL,
    login_ask_location : LibC::BOOL,
    new_user_security : LibC::Char[SIZE_SECURITY_NAME],
    default_ext : LibC::Char[SIZE_EXTENSION],
    thumbnail_file : LibC::Char[SIZE_SHORT_FILE_NAME],
    old_door_path : LibC::Char[MAX_PATH],
    enable_http_proxy : LibC::BOOL,
    smtp_max_accept_load : LibC::DWORD,
    date_format : LibC::Char[24],
    time_format : LibC::Char[24],
    default_domain : LibC::Char[SIZE_DOMAIN_NAME],
    reserved : LibC::Char[12],
    telnet_config : WildcatTelnet,
    ftp_config : WildcatFTP,
    pop3_config : WildcatPOP3,
    mail_log_options : WildcatLogOptions,
    reserved2 : LibC::Char[32],
    reserved1 : LibC::Char[32],
    smtp_log_options : WildcatLogOptions,
    nntp_config : WildcatNNTP,
    allow_logon_email : LibC::BOOL,
    case_sensitive_passwords : LibC::BOOL,
    msg_header_case_mode : LibC::DWORD,
    spam_allow_auth : LibC::BOOL,
    smtp_config : WildcatSMTP,
    http_config : WildcatHTTPD,
    timeouts : WildcatTimeouts,
    default_colors : LibC::BYTE[28],
    exclude_bulletins : LibC::DWORD[40],
    installed_components : LibC::DWORD,
    resolve_hostnames : LibC::BOOL,
    build_date : LibC::Char[16],
    domain_name : LibC::Char[SIZE_DOMAIN_NAME],
    windows_charset : LibC::BOOL,
    logon_user_name_only : LibC::BOOL do

      {% for field in %w(bbs_name sysop_name city phone first_call packet_id reg_string new_user_security default_ext) %}
      def {{field.id}} : String
        String.new(@{{field.id}}.to_unsafe)
      end
      {% end %}

      {% for field in %w(thumbnail_file old_door_path date_format time_format default_domain build_date domain_name) %}
      def {{field.id}} : String
        String.new(@{{field.id}}.to_unsafe)
      end
      {% end %}

      {% for field in %w(free_form_phone hide_anon_ftp_password logon_language_prompt assume_8n1 login_ask_location) %}
      def {{field.id}} : Bool
        @{{field.id}} == TRUE
      end
      {% end %}

      {% for field in %w(case_sensitive_passwords enable_http_proxy allow_logon_email spam_allow_auth resolve_hostnames) %}
      def {{field.id}} : Bool
        @{{field.id}} == TRUE
      end
      {% end %}

      {% for field in %w(windows_charset logon_user_name_only) %}
      def {{field.id}} : Bool
        @{{field.id}} == TRUE
      end
      {% end %}
  end

  @[Extern]
  record WildcatComputerIpPort,
    port : LibC::DWORD,
    ip_address : LibC::DWORD do
  end

  @[Extern]
  record ComputerConfig,
    name : LibC::Char[SIZE_COMPUTER_NAME],
    door_path : LibC::Char[MAX_PATH],
    cgi_path : LibC::Char[MAX_PATH],
    http_port : LibC::DWORD,
    ftp_port : LibC::DWORD,
    www_hostname : LibC::Char[80],
    servers : LibC::DWORD,
    http_proxy_port : LibC::DWORD,
    version : LibC::WORD,
    revision : LibC::WORD,
    ip_port_http : WildcatComputerIpPort,
    ip_port_ftp : WildcatComputerIpPort,
    ip_port_pop3 : WildcatComputerIpPort,
    ip_port_telnet : WildcatComputerIpPort,
    ip_port_smtp : WildcatComputerIpPort,
    ip_port_nntp : WildcatComputerIpPort,
    reserved : LibC::Char[332],
    telnet_port : LibC::DWORD,
    pop3_port : LibC::DWORD do
  end

  enum Protocols
    None
    Ascii
    Xmodem
    XmodemCRC
    Xmodem1K
    Xmodem1KG
    Ymodem
    YmodemG
    Kermit
    Zmodem
    NumProtocols
  end

  enum FIA
    Allow
    Logoff
    Lockout
  end

  enum IPFilter
    Deny
    Allow
    None
    Block
  end

  @[Extern]
  record LogonHours,
    day : LibC::DWORD[7] do
  end

  @[Extern]
  record SecurityProfile,
    name : LibC::Char[SIZE_SECURITY_NAME],
    expired_name : LibC::Char[SIZE_SECURITY_NAME],
    display_file_name : LibC::Char[SIZE_SHORT_FILE_NAME],
    door_sys_profile_name : LibC::Char[SIZE_SECURITY_NAME],
    menu_display_set : LibC::Char[SIZE_SHORT_FILE_NAME],
    daily_time_limit : LibC::DWORD,
    per_call_time_limit : LibC::DWORD,
    verify_phone_interval : LibC::DWORD,
    verify_birthdate_interval : LibC::DWORD,
    failed_info_action : LibC::DWORD,
    max_download_count_per_day : LibC::DWORD,
    download_ratio_limit : LibC::DWORD,
    max_download_kbytes_per_day : LibC::DWORD,
    download_kbytes_ratio_limit : LibC::DWORD,
    upload_time_credit : LibC::DWORD,
    expire_days : LibC::DWORD,
    password_options : LibC::WORD,
    password_expire_days : LibC::WORD,
    ftp_space_kbytes : LibC::DWORD,
    email_domain_name : LibC::Char[SIZE_DOMAIN_NAME],
    maximum_logons : LibC::DWORD,
    restricted_hours : LibC::BOOL,
    logon_hours : LogonHours do
  end

  enum MessageType
    NormalPublicPrivate
    NormalPublic
    NormalPrivate
    FidoNetMail
    EmailOnly
    UsenetNewsgroup
    UsenetNewsgroupModerated
    InternetMailingList
    FidoEcho
    ListServeForum
    UserEmail
    END = 256
  end

  enum ValidName
    Yes
    No
    Prompt
  end

  enum AuthorType
    DefaultName
    ForceUserName
    ForceAliasName
    AllowBoth
    AnonymousName
  end

  @[Extern]
  record ConfDesc,
    objectId : LibC::DWORD,
    number : LibC::DWORD,
    name : LibC::Char[SIZE_CONFERENCE_NAME],
    reserved1 : LibC::Char[16],
    conference_sysop : LibC::Char[MAX_USER_NAME],
    echo_tag : LibC::Char[SIZE_CONFERENCE_ECHOTAG],
    reply_to_address : LibC::Char[SIZE_USER_NAME],
    distribution : LibC::Char[SIZE_USER_NAME],
    mail_type : LibC::DWORD,
    prompt_to_kill_msg : LibC::BOOL,
    prompt_to_kill_attach : LibC::BOOL,
    allow_high_ascii : LibC::BOOL,
    allow_carbon : LibC::BOOL,
    allow_return_receipt : LibC::BOOL,
    long_header_format : LibC::BOOL,
    allow_attach : LibC::BOOL,
    show_ctrl_lines : LibC::BOOL,
    validate_names : LibC::DWORD,
    default_file_group : LibC::DWORD,
    max_messages : LibC::DWORD,
    days_to_keep_received_mail : LibC::DWORD,
    days_to_keep_public_mail : LibC::DWORD,
    renumber_threshold : LibC::DWORD,
    days_to_keep_external_mail : LibC::DWORD,
    delete_smtp_delivered : LibC::BOOL,
    publish_as_local_news_group : LibC::BOOL,
    options : LibC::DWORD,
    author_type : LibC::DWORD,
    unix_creation_time : LibC::DWORD,
    reserved : LibC::BYTE[6],
    default_from_address : LibC::Char[SIZE_USER_NAME],
    version : LibC::WORD do
  end

  @[Extern]
  record ShortConfDesc,
    objectId : LibC::DWORD,
    name : LibC::Char[SIZE_CONFERENCE_NAME],
    mail_type : LibC::DWORD do
  end

  @[Extern]
  record ConferenceGroup,
    objectId : LibC::DWORD,
    number : LibC::DWORD,
    name : LibC::Char[SIZE_CONFERENCEGROUP_NAME],
    reserved : LibC::Char[24] do
  end

  @[Extern]
  record FileArea,
    objectId : LibC::DWORD,
    number : LibC::DWORD,
    name : LibC::Char[SIZE_FILEAREA_NAME],
    exclude_from_new_files : LibC::BOOL,
    prompt_for_password_protect : LibC::BOOL,
    ftp_directory_name : LibC::Char[SIZE_FILEAREA_NAME],
    options : LibC::DWORD do
  end

  @[Extern]
  record ShortFileArea,
    objectId : LibC::DWORD,
    name : LibC::Char[SIZE_FILEAREA_NAME] do
  end

  @[Extern]
  record FileGroup,
    objectId : LibC::DWORD,
    number : LibC::DWORD,
    name : LibC::Char[SIZE_FILEGROUP_NAME],
    reserved : LibC::Char[24] do
  end

  enum DoorType
    Generic16
    Door32
    Doorway
  end

  @[Extern]
  record DoorInfo,
    objectId : LibC::DWORD,
    name : LibC::Char[SIZE_DOOR_NAME],
    batch : LibC::Char[SIZE_SHORT_FILE_NAME],
    display : LibC::Char[SIZE_SHORT_FILE_NAME],
    door_menu_index : LibC::DWORD,
    multi_user : LibC::BOOL,
    small_door_sys : LibC::BOOL,
    door_type : LibC::DWORD,
    reserved : LibC::Char[36] do
  end

  @[Extern]
  record LanguageInfo,
    name : LibC::Char[SIZE_LANGUAGE_NAME],
    description : LibC::Char[SIZE_LANGUAGE_DESCRIPTION],
    subcommand_chars : LibC::Char[MAX_LANGUAGE_SUBCOMMAND_CHARS],
    reserved : LibC::BYTE[72] do
  end

  enum AnswerType
    Ring
    Result
    AutoAnswer
  end

  @[Extern]
  record ShortModemProfile,
    user_defined : LibC::BOOL,
    name : LibC::Char[SIZE_MODEM_NAME] do
  end

  @[Extern]
  record ModemProfile,
    version : LibC::DWORD,
    user_defined : LibC::BOOL,
    name : LibC::Char[SIZE_MODEM_NAME],
    init_baud : LibC::DWORD,
    lock_dte : LibC::BOOL,
    hardware_flow : LibC::BOOL,
    exit_off_hook : LibC::BOOL,
    carrier_delay : LibC::DWORD,
    ring_delay : LibC::DWORD,
    drop_dtr_delay : LibC::DWORD,
    prelog_delay : LibC::DWORD,
    result_delay : LibC::DWORD,
    reset_delay : LibC::DWORD,
    answer_method : LibC::DWORD,
    enable_caller_id : LibC::DWORD,
    reset_command : LibC::Char[SIZE_MODEM_STRING],
    answer_command : LibC::Char[SIZE_MODEM_STRING],
    reserved1 : LibC::Char[SIZE_MODEM_STRING],
    off_hook : LibC::Char[SIZE_MODEM_STRING],
    ring_result : LibC::Char[SIZE_MODEM_STRING],
    connect_result : LibC::Char[SIZE_MODEM_STRING],
    reserved2 : LibC::Char[SIZE_MODEM_STRING],
    error_free_result : LibC::Char[SIZE_MODEM_STRING],
    extra_baud_results : LibC::Char[SIZE_MODEM_STRING],
    extra_baud_result_numbers : LibC::DWORD[10],
    reserved3 : LibC::Char[SIZE_MODEM_STRING],
    init_command : LibC::Char[SIZE_MODEM_STRING],
    reserved4 : LibC::Char[SIZE_MODEM_STRING],
    reserved5 : LibC::Char[3][SIZE_MODEM_STRING],
    reserved6 : LibC::Char[256],
    reserved : LibC::Char[128] do
  end

  enum CarrierCheck
    Auto
    RLSD
    DSR
  end

  @[Extern]
  record NodeConfig,
    call_types_allowed : LibC::DWORD,
    modem_name : LibC::Char[SIZE_MODEM_NAME],
    computer : LibC::Char[SIZE_COMPUTER_NAME],
    port : LibC::Char[SIZE_NODECONFIG_PORTNAME],
    permanent_line_id : LibC::DWORD,
    virtual_door_port : LibC::Char[8],
    node_disabled : LibC::BOOL,
    carrier_check_method : LibC::DWORD,
    reserved : LibC::BYTE[40] do
  end

  @[Extern]
  record ServerState,
    owner_id : LibC::DWORD,
    computer : LibC::Char[SIZE_NODECONFIG_COMPUTER],
    port : LibC::Char[SIZE_SERVERSTATE_PORT],
    state : LibC::DWORD do
  end

  @[Extern]
  record WildcatService,
    name : LibC::Char[SIZE_SERVICE_NAME],
    vendor : LibC::Char[SIZE_SERVICE_NAME],
    version : LibC::DWORD,
    address : LibC::DWORD,
    port : LibC::DWORD do
  end

  @[Extern]
  record UserInfo,
    id : LibC::DWORD,
    name : LibC::Char[SIZE_USER_NAME],
    title : LibC::Char[SIZE_USER_TITLE] do
  end

  @[Extern]
  record User,
    status : LibC::DWORD,
    info : UserInfo,
    from : LibC::Char[SIZE_USER_FROM],
    password : LibC::Char[SIZE_PASSWORD],
    security : LibC::Char[NUM_USER_SECURITY][SIZE_SECURITY_NAME],
    reserved1 : LibC::DWORD,
    allow_multiple_logins : LibC::BOOL,
    logon_hours_override : LibC::BOOL,

    real_name : LibC::Char[SIZE_USER_NAME],
    phone_number : LibC::Char[SIZE_USER_PHONE],
    company : LibC::Char[SIZE_USER_ADDRESS],
    address1 : LibC::Char[SIZE_USER_ADDRESS],
    address2 : LibC::Char[SIZE_USER_ADDRESS],
    city : LibC::Char[SIZE_USER_ADDRESS],
    state : LibC::Char[SIZE_USER_STATE],
    zip : LibC::Char[SIZE_USER_ZIP],
    country : LibC::Char[SIZE_USER_ADDRESS],
    sex : LibC::DWORD,

    editor : LibC::DWORD,
    help_level : LibC::DWORD,
    protocol : LibC::DWORD,
    terminal_type : LibC::DWORD,
    file_display : LibC::DWORD,
    msg_display : LibC::DWORD,
    packet_type : LibC::DWORD,
    lines_per_page : LibC::DWORD,
    hot_keys : LibC::BOOL,
    quote_on_reply : LibC::BOOL,
    sorted_listing : LibC::BOOL,
    page_available : LibC::BOOL,
    erase_more_prompt : LibC::BOOL,
    reserved3 : LibC::BOOL,
    language : LibC::Char[SIZE_LANGUAGE_NAME],

    last_call : FILETIME,
    last_new_files : FILETIME,
    expire_date : FILETIME,
    first_call : FILETIME,
    birth_date : FILETIME,
    conference : LibC::DWORD,
    msgs_written : LibC::DWORD,
    uploads : LibC::DWORD,
    total_upload_kbytes : LibC::DWORD,
    downloads : LibC::DWORD,
    total_download_kbytes : LibC::DWORD,
    download_count_today : LibC::DWORD,
    download_kbytes_today : LibC::DWORD,
    times_on : LibC::DWORD,
    time_left_today : LibC::DWORD,
    minutes_logged : LibC::DWORD,
    subscription_balance : Int32,
    netmail_balance : Int32,

    account_locked_out : LibC::BOOL,
    preserve_mime_messages : LibC::BOOL,
    show_email_headers : LibC::BOOL,
    last_update : FILETIME,
    system_flags : LibC::WORD,
    user_flags : LibC::WORD,
    validation : LibC::DWORD,
    password_options : LibC::WORD,
    password_expire_days : LibC::WORD,
    password_change_date : FILETIME,
    anonymous_only : LibC::BOOL,
    allow_user_directory : LibC::BOOL do
  end

  @[Extern]
  record MenuItem,
    selection : LibC::Char[SIZE_MENUITEM_SELECTION],
    description : LibC::Char[SIZE_MENUITEM_DESCRIPTION],
    command : LibC::Char[SIZE_MENUITEM_COMMAND],
    parameters : LibC::Char[SIZE_MENUITEM_COMMAND],
    reserved : LibC::BYTE[4] do
  end

  @[Extern]
  record Menu,
    objectId : LibC::DWORD,
    description : LibC::Char[SIZE_MENU_DESCRIPTION],
    display_name : LibC::Char[SIZE_SHORT_FILE_NAME],
    flags : LibC::DWORD,
    count : LibC::DWORD,
    items : MenuItem[MAX_MENU_ITEMS],
    fast_login_char : LibC::DWORD,
    security_entry_name : LibC::Char[SIZE_SECURITY_NAME],
    reserved : LibC::BYTE[128] do
  end

  @[Extern]
  record NodeInfo,
    node_status : LibC::DWORD,
    server_state : LibC::DWORD,
    connection_id : LibC::DWORD,
    last_caller : LibC::Char[SIZE_NODEINFO_LASTCALLER],
    user : UserInfo,
    user_from : LibC::Char[SIZE_USER_FROM],
    user_page_available : LibC::BOOL,
    reserved1 : LibC::BOOL,
    activity : LibC::Char[SIZE_NODEINFO_ACTIVITY],
    speed : LibC::Char[SIZE_NODEINFO_SPEED],
    time_called : FILETIME,
    current_time : FILETIME,
    reserved2 : LibC::DWORD,
    node_number : LibC::DWORD,
    minutes_left : LibC::DWORD do
  end

  enum Sex
    NotDisclosed
    Male
    Female
  end

  @[Extern]
  record FidoAddress,
    zone : LibC::WORD,
    net : LibC::WORD,
    node : LibC::WORD,
    point : LibC::WORD do
  end

  @[Extern]
  record MsgHeader,
    status : LibC::DWORD,
    conference : LibC::DWORD,
    id : LibC::DWORD,
    number : LibC::DWORD,
    from : UserInfo,
    to : UserInfo,
    subject : LibC::Char[SIZE_MESSAGE_SUBJECT],
    posted_time_gmt : FILETIME,
    msg_time : FILETIME,
    read_time : FILETIME,
    private_ : LibC::BOOL,
    received : LibC::BOOL,
    receipt_requested : LibC::BOOL,
    deleted : LibC::BOOL,
    tagged : LibC::BOOL,
    reference : LibC::DWORD,
    reply_count : LibC::DWORD,
    fido_from : FidoAddress,
    fido_to : FidoAddress,
    fido_flags : LibC::DWORD,
    msg_size : LibC::DWORD,
    prev_unread : LibC::DWORD,
    next_unread : LibC::DWORD,
    network : LibC::Char[SIZE_MESSAGE_NETWORK],
    attachment_sfn : LibC::Char[SIZE_SHORT_FILE_NAME],
    alllow_display_macros : LibC::BOOL,
    added_by_user_id : LibC::DWORD,
    exported : LibC::BOOL,
    mail_flags : LibC::DWORD,
    next_attachment : LibC::DWORD,
    read_count : LibC::DWORD,
    attachment : LibC::Char[SIZE_ATTACH_FILE_NAME],
    extra_crc32 : LibC::DWORD,
    reserved : LibC::DWORD[7] do
  end

  @[Extern]
  record FileComment,
    area : LibC::DWORD,
    id : LibC::DWORD do
  end

  @[Extern]
  record FileRecord,
    status : LibC::DWORD,
    area : LibC::DWORD,
    sf_name : LibC::Char[SIZE_SHORT_FILE_NAME],
    description : LibC::Char[SIZE_FILE_DESCRIPTION],
    password : LibC::Char[SIZE_PASSWORD],
    file_flags : LibC::DWORD,
    size : LibC::DWORD,
    file_time : FILETIME,
    last_accessed : FILETIME,
    never_overwrite : LibC::BOOL,
    never_delete : LibC::BOOL,
    free_file : LibC::BOOL,
    copy_before_download : LibC::BOOL,
    offline : LibC::BOOL,
    failed_scan : LibC::BOOL,
    free_time : LibC::BOOL,
    downloads : LibC::DWORD,
    cost : LibC::DWORD,
    uploader : UserInfo,
    has_long_description : LibC::BOOL,
    post_time : FILETIME,
    private_user_id : LibC::DWORD,
    first_comment : FileComment,
    reserved : LibC::BYTE[24],
    name : LibC::Char[SIZE_LONG_FILE_NAME],
    reserved2 : LibC::BYTE[100] do
  end

  @[Extern]
  record FullFileRecord,
    info : FileRecord,
    stored_path : LibC::Char[MAX_PATH],
    long_description : LibC::Char[MAX_FILE_LONGDESC_LINES][SIZE_FILE_LONGDESC] do
  end

  @[Extern]
  record SpellSuggestList,
    words : LibC::Char[10][32] do
  end

  @[Extern]
  record SystemEventFileInfo,
    file_area : LibC::DWORD,
    connection_id : LibC::DWORD,
    timestamp : FILETIME,
    file_name : LibC::Char[SIZE_LONG_FILE_NAME] do
  end

  @[Extern]
  record SystemControlViewMSG,
    line : LibC::WORD,
    count : LibC::WORD,
    text : LibC::WORD[3][80],
    cursor_x : LibC::WORD,
    cursor_y : LibC::WORD,
    minutes_left : LibC::WORD do
  end

  @[Extern]
  record SystemPageNewMessage,
    conference : LibC::DWORD,
    conference_name : LibC::Char[SIZE_CONFERENCE_NAME],
    id : LibC::DWORD,
    from : UserInfo,
    subject : LibC::Char[SIZE_MESSAGE_SUBJECT] do
  end

  @[Extern]
  record SystemPageInstantMessage,
    from : LibC::Char[MAX_USER_NAME],
    text : LibC::Char[SIZE_SYSTEMPAGE_LINES][SIZE_SYSTEMPAGE_TEXT],
    invite_to_chat : LibC::BOOL do
  end

  @[Extern]
  record ConnectionInfo,
    connection_id : LibC::DWORD,
    node : LibC::DWORD,
    time : LibC::DWORD,
    idle_time : LibC::DWORD,
    calls : LibC::DWORD,
    windows_user_name : LibC::Char[80],
    computer : LibC::Char[SIZE_COMPUTER_NAME],
    ip_address : LibC::DWORD,
    program_name : LibC::Char[SIZE_PROGRAM_NAME],
    domain : LibC::Char[SIZE_DOMAIN_NAME],
    reserved1 : LibC::BYTE[132],
    ref_count : LibC::DWORD,
    user : UserInfo,
    handles_open : LibC::DWORD,
    channels_open : LibC::DWORD,
    current_tid : LibC::DWORD,
    peer_address : LibC::DWORD,
    call_type : LibC::DWORD,
    status : LibC::Char[SIZE_NODEINFO_ACTIVITY],
    reserved : LibC::BYTE[60] do
  end

  @[Extern]
  record WildcatServerInfo,
    total_calls : LibC::DWORD,
    total_users : LibC::DWORD,
    total_messages : LibC::DWORD,
    total_files : LibC::DWORD,
    memory_usage : LibC::DWORD,
    memory_load : LibC::DWORD,
    last_message_id : LibC::DWORD,
    last_user_id : LibC::DWORD,
    server_version : LibC::DWORD,
    server_build : LibC::DWORD,
    reserved : LibC::BYTE[84] do
  end

  @[Extern]
  record WildcatProcessTimes,
    ft_system : FILETIME,
    ft_start : FILETIME,
    ft_exit : FILETIME,
    ft_kernel : FILETIME,
    ft_user : FILETIME,
    reserved : LibC::BYTE[24] do
  end

  @[Extern]
  record WildcatSASLContext,
    sasl_method : LibC::Char[SIZE_SASL_NAME],
    challenge : LibC::Char[256],
    options : LibC::DWORD,
    state : LibC::DWORD,
    user_id : LibC::DWORD,
    data : LibC::BYTE[4096],
    username : LibC::Char[SIZE_USER_NAME],
    realm : LibC::Char[MAX_PATH],
    domain : LibC::Char[MAX_PATH],
    nonce : LibC::Char[MAX_PATH],
    cnonce : LibC::Char[MAX_PATH],
    cnonce_count : LibC::DWORD,
    uri : LibC::Char[MAX_PATH],
    method : LibC::Char[20],
    alg : LibC::Char[64],
    qop : LibC::Char[64] do
  end

  @[Extern]
  record OpenFileInfo,
    file : LibC::ULONG,
    size : LibC::DWORD,
    write_time : FILETIME,
    attributes : LibC::DWORD,
    size_high : LibC::DWORD,
    reserved : LibC::BYTE[232] do
  end

  @[Extern]
  record WildcatServerGuid,
    time : FILETIME,
    count : LibC::DWORD,
    guid : LibC::Char[MAX_PATH] do
  end

  @[Extern]
  record WildcatGeoIP,
    has_data : LibC::BOOL,
    ipaddr : LibC::Char[16],
    city : LibC::Char[32],
    continent : LibC::Char[52],
    country : LibC::Char[52],
    latitude : LibC::Char[16],
    longitude : LibC::Char[16],
    metro_code : LibC::Char[16],
    tzone : LibC::Char[52],
    postal : LibC::Char[16],
    country_code : LibC::Char[8],
    region_code : LibC::Char[16],
    region_name : LibC::Char[52] do
  end

  record ChannelMessage,
    channel : LibC::DWORD,
    sender_id : LibC::DWORD,
    user_data : LibC::WORD,
    data_size : LibC::WORD,
    data : LibC::BYTE[MAX_CHANNEL_MESSAGE_SIZE] do
  end

  alias WildcatCallback = Proc(LibC::DWORD, ChannelMessage, LibC::DWORD)*
end