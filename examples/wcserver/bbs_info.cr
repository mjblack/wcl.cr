require "../../src/wcl"

alias WCS = WCL::WCServer

unless WCS.wildcat_server_connect
  puts "Failed to connect to Wildcat! Server."
  exit 1
end

unless WCS.wildcat_server_create_context
  puts "Failed to create Wildcat! Server context."
  exit 1
end

unless WCS.login_system
  puts "Failed to login to Wildcat! Server."
  exit 1
end

mw = WCS.get_makewild
puts "======= MakeWild ======="
puts "Version: #{mw.version}"
puts "BBS Name: #{mw.bbs_name}"
puts "Sysop Name: #{mw.sysop_name}"
puts "City: #{mw.city}"
puts "Phone: #{mw.phone}"
puts "First Call: #{mw.first_call}"
puts "Packet ID: #{mw.packet_id}"
puts "Reg String: #{mw.reg_string}"
puts "System Access: #{mw.system_access}"
puts "Max Login Attempts: #{mw.max_login_attempts}"
puts "Free Form Phone: #{mw.free_form_phone}"
puts "Hide Anon FTP Password: #{mw.hide_anon_ftp_password}"
puts "Logon Language Prompt: #{mw.logon_language_prompt}"
puts "Assume 8n1: #{mw.assume_8n1}"
puts "Login Ask Location: #{mw.login_ask_location}"
puts "New User Security: #{mw.new_user_security}"
puts "Default Extension: #{mw.default_ext}"
puts "Thumbnail File: #{mw.thumbnail_file}"
puts "Old Door Path: #{mw.old_door_path}"
puts "Enable HTTP Proxy: #{mw.enable_http_proxy}"
puts "SMTP Max Accept Load: #{mw.smtp_max_accept_load}"
puts "Date Format: #{mw.date_format}"
puts "Time Format: #{mw.time_format}"
puts "Default Domain: #{mw.default_domain}"
puts "Allow Logon Email: #{mw.allow_logon_email}"
puts "Case Sensitive Passwords: #{mw.case_sensitive_passwords}"
puts "Msg Header Case Mode: #{mw.msg_header_case_mode}"
puts "Spam Allow Auth: #{mw.spam_allow_auth}"
puts "Installed Components: #{mw.installed_components}"
puts "Resolve Hostnames: #{mw.resolve_hostnames}"
puts "Build date: #{mw.build_date}"
puts "Domain Name: #{mw.domain_name}"
puts "Windows Charset: #{mw.windows_charset}"
puts "Logon User Name Only: #{mw.logon_user_name_only}"

WCS.logout_user