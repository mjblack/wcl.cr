module WCL
  module WCServer
    extend self

    def get_makewild : WCL::MakeWild
      mwptr = Pointer(WCL::MakeWild).malloc(sizeof(WCL::MakeWild))
      C.GetMakewild(mwptr)
      mwptr.value
    end

    def get_makewild_ex(domain : String, set_domain : Bool) : WCL::MakeWild
      mwptr = Pointer(WCL::MakeWild).malloc(sizeof(WCL::MakeWild))
      C.GetMakewildEx(domain.to_unsafe, set_domain.to_unsafe, mwptr)
      mwptr.value
    end

    def wildcat_server_connect(parent : LibC::HANDLE?) : Bool
      # bRet = C.WildcatServerConnect(parent)
      # bRet == 0 ? false : true
      cbool(C.WildcatServerConnect(parent))
    end

    def wildcat_server_connect : Bool
      wildcat_server_connect(nil)
    end

    def wildcat_server_create_context : Bool
      cbool(C.WildcatServerCreateContext)
    end

    def login_system : Bool
      cbool(C.LoginSystem)
    end

    def logout_user : Bool
      cbool(C.LogoutUser)
    end

    def wildcat_logged_in : WCL::User
      userptr = Pointer(WCL::User).malloc(sizeof(WCL::User))
      C.WildcatLoggedIn(userptr)
      userptr.value
    end

    def wildcat_server_delete_context : Bool
      cbool(C.WildcatServerDeleteContext)
    end

    def get_server_platform : LibC::DWORD
      C.WcGetServerPlatform
    end

    def get_wildcat_version : LibC::DWORD
      C.GetWildcatVersion
    end

    def get_wildcat_build : LibC::DWORD
      C.GetWildcatBuild
    end

    def get_wildcat_server_version : LibC::DWORD
      C.WcGetServerVersion
    end

    def get_wildcat_server_build : LibC::DWORD
      C.WcGetServerBuild
    end

    def wildcat_server_connect_specific(parent : LibC::HANDLE?, computername : String) : Bool
      cbool(C.WildcatServerConnectSpecific(parent, computername.to_unsafe))
    end

    def wildcat_server_connect_specific(computername : String) : Bool
      wildcat_server_connect_specific(nil, computername)
    end

    def wildcat_server_connect_local(parent : LibC::HANDLE?) : Bool
      cbool(C.WildcatServerConnectLocal(parent))
    end

    def wildcat_server_connect_local : Bool
      wildcat_server_connect_local(nil)
    end

    def wildcat_server_dialog(parent : LibC::HANDLE?, computername : String, namesize : LibC::DWORD) : Bool
      cbool(C.WildcatServerDialog(parent, computername.to_unsafe, namesize))
    end

    def wildcat_server_dialog(computername : String, namesize : LibC::DWORD) : Bool
      wildcat_server_dialog(nil, computername, namesize)
    end

    def set_wildcat_error_mode(verbose : Bool) : Bool
      cbool(C.SetWildcatErrorMode(verbose))
    end

    def wildcat_server_shutdown(pwd : String, force : Bool) : Bool
      cbool(C.WildcatServerShutdown(pwd.to_unsafe, force))
    end

    def get_connected_server(computername : String, namesize : LibC::DWORD) : Bool
      cbool(C.GetConnectedServer(computername.to_unsafe, namesize))
    end

    def wildcat_server_create_context_from_handle(context : LibC::DWORD) : Bool
      cbool(C.WildcatServerCreateContextFromHandle(context))
    end

    def wildcat_server_create_context_from_challenge(challenge : String) : Bool
      cbool(C.WildcatServerCreateContextFromChallenge(challenge.to_unsafe))
    end

    def get_wildcat_server_context_handle : LibC::DWORD
      C.GetWildcatServerContextHandle
    end

    def setup_wildcat_callback(cbproc : WildcatCallback, userdata : LibC::DWORD) : Bool
      cbool(C.SetupWildcatCallback(cbproc, userdata))
    end

    def grant_thread_access(tid : LibC::DWORD) : Bool
      cbool(C.GrantThreadAccess(tid))
    end

    def get_wildcat_thread_context : LibC::DWORD
      C.GetWildcatThreadContext
    end

    def set_wildcat_thread_context(context : LibC::DWORD) : Bool
      cbool(C.SetWildcatThreadContext(context))
    end

    def get_node : LibC::DWORD
      C.GetNode
    end

    def set_node_status(nodestatus : LibC::DWORD) : Bool
      cbool(C.SetNodeStatus(nodestatus))
    end

    def get_computer_config : WCL::ComputerConfig
      cc_ptr = Pointer(WCL::ComputerConfig).malloc(sizeof(WCL::ComputerConfig))
      cbool(C.GetComputerConfig(cc_ptr))
      cc_ptr.value
    end

    def get_challenge_string(bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.GetChallengeString(buffer.to_unsafe, bufsize))
      buffer
    end

    def lookup_name(name : String) : WCL::UserInfo
      uinfo_ptr = Pointer(WCL::UserInfo).malloc(sizeof(WCL::UserInfo))
      cbool(C.LookupName(name.to_unsafe, uinfo_ptr))
      uinfo_ptr.value
    end

    def allocate_node(node : LibC::DWORD, calltype : LibC::DWORD, speed : String) : Bool
      cbool(C.AllocateNode(node, calltype, speed.to_unsafe))
    end

    def login_user(userid : LibC::DWORD, password : String) : WCL::User
      user_ptr = Pointer(WCL::User).malloc(sizeof(WCL::User))
      cbool(C.LoginUser(userid, password.to_unsafe, user_ptr))
      user_ptr.value
    end

    def login_user_ex(userid : LibC::DWORD, password : String, calltype : LibC::DWORD, speed : String) : WCL::User
      user_ptr = Pointer(WCL::User).malloc(sizeof(WCL::User))
      cbool(C.LoginUserEx(userid, password.to_unsafe, calltype, speed.to_unsafe, user_ptr))
      user_ptr.value
    end

    def login_radius_user(userid : LibC::DWORD, chapid : UInt8, challenge : Pointer(UInt8), challengesize : LibC::DWORD, challresponse : Pointer(UInt8)) : WCL::User
      user_ptr = Pointer(WCL::User).malloc(sizeof(WCL::User))
      cbool(C.LoginRadiusUser(userid, chapid, challenge, challengesize, challresponse, user_ptr))
      user_ptr.value
    end

    def get_users_online : LibC::DWORD
      C.GetUsersOnline
    end

    def get_profile_object_flags(profile : String, objectid : LibC::DWORD) : LibC::DWORD
      C.GetProfileObjectFlags(profile.to_unsafe, objectid)
    end
    # File and directory related wrappers

    def wc_close_handle(handle : WCL::WCHANDLE) : Bool
      cbool(C.WcCloseHandle(handle))
    end

    def wc_create_directory(dirname : String) : Bool
      cbool(C.WcCreateDirectory(dirname.to_unsafe))
    end

    def wc_remove_directory(dirname : String) : Bool
      cbool(C.WcRemoveDirectory(dirname.to_unsafe))
    end

    def wc_create_file(fn : String, access : LibC::DWORD, share : LibC::DWORD, create : LibC::DWORD) : WCL::WCHANDLE
      C.WcCreateFile(fn.to_unsafe, access, share, create)
    end

    def wc_delete_file(fn : String) : Bool
      cbool(C.WcDeleteFile(fn.to_unsafe))
    end

    def wc_exist_file(fn : String) : Bool
      cbool(C.WcExistFile(fn.to_unsafe))
    end

    # File search and info wrappers

    def wc_find_first_file(fn : String) : NamedTuple(WCL::WCHANDLE, WCL::Win32FindDataA)
      ptr = Pointer(WCL::Win32FindDataA).malloc(sizeof(WCL::Win32FindDataA))
      handle = C.WcFindFirstFile(fn.to_unsafe, ptr)
      { handle: handle, data: ptr.value }
    end

    def wc_find_next_file(handle : WCL::WCHANDLE) : NamedTuple(WCL::WCHANDLE, WCL::Win32FindDataA)
      ptr = Pointer(WCL::Win32FindDataA).malloc(sizeof(WCL::Win32FindDataA))
      unless cbool(C.WcFindNextFile(handle, ptr))
        raise Exception.new("Failed to find next file")
      end
      { handle: handle, data: ptr.value }
    end

    def wc_find_close(handle : WCL::WCHANDLE) : Bool
      cbool(C.WcFindClose(handle))
    end

    def wc_get_file_size(handle : WCL::WCHANDLE) : LibC::DWORD
      C.WcGetFileSize(handle)
    end

    def wc_get_file_time(handle : WCL::WCHANDLE) : WCL::FILETIME
      ft_ptr = Pointer(WCL::FILETIME).malloc(sizeof(WCL::FILETIME))
      cbool(C.WcGetFileTime(handle, ft_ptr))
      ft_ptr.value
    end

    def wc_get_file_time_by_name(fn : String) : WCL::FILETIME
      ft_ptr = Pointer(WCL::FILETIME).malloc(sizeof(WCL::FILETIME))
      cbool(C.WcGetFileTimeByName(fn.to_unsafe, ft_ptr))
      ft_ptr.value
    end

    def wc_move_file(src : String, dst : String) : Bool
      cbool(C.WcMoveFile(src.to_unsafe, dst.to_unsafe))
    end

    # File read/write wrappers

    def wc_read_file(handle : WCL::WCHANDLE, buf : Pointer(Void), requested : LibC::DWORD) : String
      bytesread = 0_u32
      buf = Pointer(Void).malloc(requested)
      unless cbool(C.WcReadFile(handle, buf, requested, pointerof(bytesread)))
        raise Exception.new("Failed to read file")
      end
      String.new(buf, bytesread)
    end

    def wc_read_line(handle : WCL::WCHANDLE, bufsize : LibC::DWORD) : String
      buf = Pointer(LibC::Char).malloc(bufsize)
      cbool(C.WcReadLine(handle, buf, bufsize))
      String.new(buf, bufsize)
    end

    def wc_set_end_of_file(handle : WCL::WCHANDLE) : Bool
      cbool(C.WcSetEndOfFile(handle))
    end

    def wc_set_file_pointer(handle : WCL::WCHANDLE, distance : LibC::LONG, method : LibC::DWORD) : LibC::DWORD
      C.WcSetFilePointer(handle, distance, method)
    end

    def wc_set_file_time(handle : WCL::WCHANDLE, ft : WCL::FILETIME) : Bool
      cbool(C.WcSetFileTime(handle, ft.to_unsafe))
    end

    def wc_write_file(handle : WCL::WCHANDLE, buf : String, requested : LibC::DWORD) : LibC::DWORD
      byteswritten = 0_u32
      unless cbool(C.WcWriteFile(handle, buf.to_unsafe, requested, pointerof(byteswritten)))
        raise Exception.new("Failed to write file")
      end
      byteswritten
    end

    def wc_rename_file(src : String, dst : String) : Bool
      cbool(C.WcRenameFile(src.to_unsafe, dst.to_unsafe))
    end

    def wc_resolve_path_name(wfname : String, access : LibC::DWORD, share : LibC::DWORD, create : LibC::DWORD, destsize : LibC::DWORD) : String
      buf = Pointer(LibC::Char).malloc(destsize)
      unless cbool(C.WcResolvePathName(wfname.to_unsafe, access, share, create, buf, destsize))
        raise Exception.new("Failed to resolve path name")
      end
      String.new(buf, destsize)
    end

    def get_connection_id : LibC::DWORD
      C.GetConnectionId
    end

    def get_total_calls(increment : Bool) : LibC::DWORD
      C.GetTotalCalls(increment.to_unsafe)
    end

    def get_text(fn : String, bufsize : LibC::DWORD) : String
      buf = Pointer(LibC::Char).malloc(bufsize)
      size_ptr = 0_u32
      r = cbool(C.GetText(fn.to_unsafe, buf.to_unsafe, bufsize, pointerof(size_ptr)))
      unless r
        raise Exception.new("Failed to get text from #{fn} file")
      end
      String.new(buf, size_ptr)
    end


    def get_object_flags(objectid : LibC::DWORD) : LibC::DWORD
      C.GetObjectFlags(objectid)
    end

    def get_multiple_object_flags(objectids : Pointer(LibC::DWORD), count : LibC::DWORD, flags : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetMultipleObjectFlags(objectids, count, flags))
    end

    def get_object_by_id(objectid : LibC::DWORD, objectname : Pointer(WCL::ObjectName)) : Bool
      cbool(C.GetObjectById(objectid, objectname))
    end

    def get_multiple_objects_by_id(objectids : Pointer(LibC::DWORD), count : LibC::DWORD, objectname : Pointer(WCL::ObjectName)) : Bool
      cbool(C.GetMultipleObjectsById(objectids, count, objectname))
    end

    def get_object_by_name(classid : LibC::DWORD, name : String, objectname : Pointer(WCL::ObjectName), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetObjectByName(classid, name.to_unsafe, objectname, tid))
    end

    def get_next_object_by_name(objectname : Pointer(WCL::ObjectName), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetNextObjectByName(objectname, tid))
    end

    def get_string_object_id(objectclass : LibC::DWORD, name : String) : LibC::DWORD
      C.GetStringObjectId(objectclass, name.to_unsafe)
    end

    def get_string_object_flags(objectclass : LibC::DWORD, name : String) : LibC::DWORD
      C.GetStringObjectFlags(objectclass, name.to_unsafe)
    end

    # ––– Security Profile Wrappers –––

    def get_security_profile_count : LibC::DWORD
      C.GetSecurityProfileCount
    end

    def get_security_profile_names(count : LibC::DWORD, names : Pointer(LibC::Char)) : Bool
      cbool(C.GetSecurityProfileNames(count, names))
    end

    def get_security_profile_by_index(index : LibC::DWORD, profile : Pointer(WCL::SecurityProfile)) : Bool
      cbool(C.GetSecurityProfileByIndex(index, profile))
    end

    def get_security_profile_by_name(name : String, profile : Pointer(WCL::SecurityProfile)) : Bool
      cbool(C.GetSecurityProfileByName(name.to_unsafe, profile))
    end

    # ––– Access Profile Wrappers –––

    def get_access_profile_count : LibC::DWORD
      C.GetAccessProfileCount
    end

    def get_access_profile_names(count : LibC::DWORD, names : Pointer(LibC::Char)) : Bool
      cbool(C.GetAccessProfileNames(count, names))
    end

    def get_access_profile_name(index : LibC::DWORD, name : Pointer(LibC::Char)) : Bool
      cbool(C.GetAccessProfileName(index, name))
    end

    # ––– Conference and File Wrappers –––

    def get_conference_count : LibC::DWORD
      C.GetConferenceCount
    end

    def get_conf_desc(conference : LibC::DWORD, cd : Pointer(WCL::ConfDesc)) : Bool
      cbool(C.GetConfDesc(conference, cd))
    end

    def get_conference_group_count : LibC::DWORD
      C.GetConferenceGroupCount
    end

    def get_conference_group(index : LibC::DWORD, cg : Pointer(WCL::ConferenceGroup)) : Bool
      cbool(C.GetConferenceGroup(index, cg))
    end

    def get_file_group_count : LibC::DWORD
      C.GetFileGroupCount
    end

    def get_file_group(index : LibC::DWORD, fg : Pointer(WCL::FileGroup)) : Bool
      cbool(C.GetFileGroup(index, fg))
    end

    def get_door_count : LibC::DWORD
      C.GetDoorCount
    end

    def get_door(index : LibC::DWORD, di : Pointer(WCL::DoorInfo)) : Bool
      cbool(C.GetDoor(index, di))
    end

    def get_language_count : LibC::DWORD
      C.GetLanguageCount
    end

    def get_language(index : LibC::DWORD, li : Pointer(WCL::LanguageInfo)) : Bool
      cbool(C.GetLanguage(index, li))
    end

    def get_modem_profile(name : String, mp : Pointer(WCL::ModemProfile)) : Bool
      cbool(C.GetModemProfile(name.to_unsafe, mp))
    end

    # ––– Node and User Related Wrappers –––

    def get_node_count : LibC::DWORD
      C.GetNodeCount
    end

    def get_maximum_user_count : LibC::DWORD
      C.GetMaximumUserCount
    end

    def get_node_config(node : LibC::DWORD, nc : Pointer(WCL::NodeConfig)) : Bool
      cbool(C.GetNodeConfig(node, nc))
    end

    def get_node_info(node : LibC::DWORD, ni : Pointer(WCL::NodeInfo)) : Bool
      cbool(C.GetNodeInfo(node, ni))
    end

    def get_node_info_by_connection_id(id : LibC::DWORD, ni : Pointer(WCL::NodeInfo)) : Bool
      cbool(C.GetNodeInfoByConnectionId(id, ni))
    end

    def get_node_info_by_name(name : String, ni : Pointer(WCL::NodeInfo)) : Bool
      cbool(C.GetNodeInfoByName(name.to_unsafe, ni))
    end

    # ––– Additional Wrappers –––
    # File Record Wrappers

    def get_file_rec_absolute(ref : LibC::DWORD, f : Pointer(WCL::FileRecord)) : Bool
      cbool(C.GetFileRecAbsolute(ref, f))
    end

    def get_file_rec_by_name_area(name : String, area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetFileRecByNameArea(name.to_unsafe, area, f, tid))
    end

    def get_file_rec_by_area_name(area : LibC::DWORD, name : String, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetFileRecByAreaName(area, name.to_unsafe, f, tid))
    end

    def get_file_rec_by_area_date(area : LibC::DWORD, t : Pointer(WCL::FILETIME), f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetFileRecByAreaDate(area, t, f, tid))
    end

    def get_file_rec_by_uploader(id : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetFileRecByUploader(id, f, tid))
    end

    def get_first_file_rec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetFirstFileRec(keynum, f, tid))
    end

    def get_full_file_rec(f : Pointer(WCL::FileRecord), full : Pointer(WCL::FullFileRecord)) : Bool
      cbool(C.GetFullFileRec(f, full))
    end

    def get_last_file_rec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetLastFileRec(keynum, f, tid))
    end

    def get_next_file_rec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetNextFileRec(keynum, f, tid))
    end

    def get_prev_file_rec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.GetPrevFileRec(keynum, f, tid))
    end

    def get_total_files : LibC::DWORD
      C.GetTotalFiles
    end

    def get_total_files_in_area(area : LibC::DWORD) : LibC::DWORD
      C.GetTotalFilesInArea(area)
    end

    def get_total_files_in_group(group : LibC::DWORD) : LibC::DWORD
      C.GetTotalFilesInGroup(group)
    end

    def increment_download_count(f : Pointer(WCL::FileRecord)) : Bool
      cbool(C.IncrementDownloadCount(f))
    end

    def search_file_rec_by_name_area(name : String, area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.SearchFileRecByNameArea(name.to_unsafe, area, f, tid))
    end

    def search_file_rec_by_area_name(area : LibC::DWORD, name : String, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.SearchFileRecByAreaName(area, name.to_unsafe, f, tid))
    end

    def search_file_rec_by_area_date(area : LibC::DWORD, t : Pointer(WCL::FILETIME), f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.SearchFileRecByAreaDate(area, t, f, tid))
    end

    def search_file_rec_by_date_area(t : Pointer(WCL::FILETIME), area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.SearchFileRecByDateArea(t, area, f, tid))
    end

    def search_file_rec_by_uploader(id : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : Bool
      cbool(C.SearchFileRecByUploader(id, f, tid))
    end

    def update_file_rec(f : Pointer(WCL::FileRecord)) : Bool
      cbool(C.UpdateFileRec(f))
    end

    def update_full_file_rec(f : Pointer(WCL::FullFileRecord)) : Bool
      cbool(C.UpdateFullFileRec(f))
    end

    # Message Wrappers (examples)

    def add_message(msg : Pointer(WCL::MsgHeader), text : String) : Bool
      cbool(C.AddMessage(msg, text.to_unsafe))
    end

    def delete_message(msg : Pointer(WCL::MsgHeader)) : Bool
      cbool(C.DeleteMessage(msg))
    end

    def get_high_message_number(conf : LibC::DWORD) : LibC::DWORD
      C.GetHighMessageNumber(conf)
    end

    def get_low_message_number(conf : LibC::DWORD) : LibC::DWORD
      C.GetLowMessageNumber(conf)
    end

    def get_message_by_id(conf : LibC::DWORD, msgid : LibC::DWORD, msg : Pointer(WCL::MsgHeader)) : Bool
      cbool(C.GetMessageById(conf, msgid, msg))
    end

    def get_msg_id_from_number(conf : LibC::DWORD, number : LibC::DWORD) : LibC::DWORD
      C.GetMsgIdFromNumber(conf, number)
    end

    def get_msg_number_from_id(conf : LibC::DWORD, msgid : LibC::DWORD) : LibC::DWORD
      C.GetMsgNumberFromId(conf, msgid)
    end
    # Additional wrapper methods for miscellaneous C functions

    def wc_sasl_get_method_name(size : LibC::DWORD, index : LibC::DWORD) : String
      buffer = "\0" * size.to_i
      cbool(C.WcSASLGetMethodName(buffer.to_unsafe, size, index))
      buffer
    end

    def wc_sasl_authenticate_user(ctx : Pointer(WCL::WildcatSASLContext), from_client : String, response : String, response_size : LibC::DWORD, user : Pointer(WCL::User)) : LibC::DWORD
      C.WcSASLAuthenticateUser(ctx, from_client.to_unsafe, response.to_unsafe, response_size, user)
    end

    def wc_sasl_authenticate_user_ex(ctx : Pointer(WCL::WildcatSASLContext), from_client : String, response : String, response_size : LibC::DWORD, calltype : LibC::DWORD, speed : String, user : Pointer(WCL::User)) : LibC::DWORD
      C.WcSASLAuthenticateUserEx(ctx, from_client.to_unsafe, response.to_unsafe, response_size, calltype, speed.to_unsafe, user)
    end

    def wc_sasl_check_authentication(ctx : Pointer(WCL::WildcatSASLContext), from_client : String, response : String, response_size : LibC::DWORD) : LibC::DWORD
      C.WcSASLCheckAuthentication(ctx, from_client.to_unsafe, response.to_unsafe, response_size)
    end

    def wc_get_process_times : WCL::WildcatProcessTimes
      pt_ptr = Pointer(WCL::WildcatProcessTimes).malloc(sizeof(WCL::WildcatProcessTimes))
      cbool(C.WcGetProcessTimes(pt_ptr))
      pt_ptr.value
    end

    def set_context_peer_address(address : LibC::DWORD) : Bool
      cbool(C.SetContextPeerAddress(address))
    end

    def wc_get_private_profile_string(section : String, key : String, default : String, ini_file : String, destsize : LibC::DWORD) : String
      buffer = "\0" * destsize.to_i
      size_ptr = Pointer(LibC::DWORD).malloc(sizeof(LibC::DWORD))
      size_ptr.value = destsize
      cbool(C.WcGetPrivateProfileString(section.to_unsafe, key.to_unsafe, default.to_unsafe, buffer.to_unsafe, size_ptr, ini_file.to_unsafe))
      buffer
    end

    def wc_write_private_profile_string(section : String, key : String, value : String, ini_file : String) : Bool
      cbool(C.WcWritePrivateProfileString(section.to_unsafe, key.to_unsafe, value.to_unsafe, ini_file.to_unsafe))
    end

    def wc_get_private_profile_section(section : String, ini_file : String, destsize : LibC::DWORD) : String
      buffer = "\0" * destsize.to_i
      size_ptr = Pointer(LibC::DWORD).malloc(sizeof(LibC::DWORD))
      cbool(C.WcGetPrivateProfileSection(section.to_unsafe, buffer.to_unsafe, size_ptr, ini_file.to_unsafe))
      buffer
    end

    def wc_create_file_ex(filename : String, access : LibC::DWORD, sharemode : LibC::DWORD, create : LibC::DWORD, open_file_info : Pointer(WCL::OpenFileInfo)) : WCL::WCHANDLE
      C.WcCreateFileEx(filename.to_unsafe, access, sharemode, create, open_file_info)
    end

    def get_connection_info_from_challenge(challenge : String) : WCL::ConnectionInfo
      ci_ptr = Pointer(WCL::ConnectionInfo).malloc(sizeof(WCL::ConnectionInfo))
      cbool(C.GetConnectionInfoFromChallenge(challenge.to_unsafe, ci_ptr))
      ci_ptr.value
    end

    def delete_user_variable(id : LibC::DWORD, section : String, key : String) : Bool
      cbool(C.DeleteUserVariable(id, section.to_unsafe, key.to_unsafe))
    end

    def wc_check_user_name(name : String) : Bool
      cbool(C.WcCheckUserName(name.to_unsafe))
    end

    def wc_set_message_attachment(msg : Pointer(WCL::MsgHeader), filename : String, copy_to : Bool) : Bool
      cbool(C.WcSetMessageAttachment(msg, filename.to_unsafe, copy_to))
    end

    def wc_local_copy_to_server(local : String, server : String, ms_slice : Int32) : Bool
      cbool(C.WcLocalCopyToServer(local.to_unsafe, server.to_unsafe, ms_slice))
    end

    def wc_set_current_domain(domain : String) : Bool
      cbool(C.WcSetCurrentDomain(domain.to_unsafe))
    end

    def wc_get_current_domain(bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetCurrentDomain(buffer.to_unsafe, bufsize))
      buffer
    end

    def wc_get_default_domain(bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetDefaultDomain(buffer.to_unsafe, bufsize))
      buffer
    end

    def wc_get_domain_count : LibC::DWORD
      C.WcGetDomainCount
    end

    def wc_get_domain(index : LibC::DWORD, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetDomain(index, buffer.to_unsafe, bufsize))
      buffer
    end

    def wc_get_domain_config_string(domain : String, section : String, key : String, default : String, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetDomainConfigString(domain.to_unsafe, section.to_unsafe, key.to_unsafe, buffer.to_unsafe, bufsize, default.to_unsafe))
      buffer
    end

    def wc_get_domain_config_bool(domain : String, section : String, key : String, default : Bool) : Bool
      bval_ptr = Pointer(LibC::BOOL).malloc(sizeof(LibC::BOOL))
      cbool(C.WcGetDomainConfigBool(domain.to_unsafe, section.to_unsafe, key.to_unsafe, bval_ptr, default))
      bval_ptr.value
    end

    def wc_get_domain_config_int(domain : String, section : String, key : String, default : LibC::DWORD) : LibC::DWORD
      value_ptr = Pointer(LibC::DWORD).malloc(sizeof(LibC::DWORD))
      cbool(C.WcGetDomainConfigInt(domain.to_unsafe, section.to_unsafe, key.to_unsafe, value_ptr, default))
      value_ptr.value
    end

    def wc_get_domain_config_section(domain : String, section : String, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      size_ptr = Pointer(LibC::DWORD).malloc(sizeof(LibC::DWORD))
      cbool(C.WcGetDomainConfigSection(domain.to_unsafe, section.to_unsafe, buffer.to_unsafe, bufsize, size_ptr))
      buffer
    end

    def wc_get_http_config_var(section : String, key : String, default : String, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetHttpConfigVar(section.to_unsafe, key.to_unsafe, buffer.to_unsafe, bufsize, default.to_unsafe))
      buffer
    end

    def wc_get_config_file_var(file : String, section : String, key : String, default : String, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetConfigFileVar(file.to_unsafe, section.to_unsafe, key.to_unsafe, buffer.to_unsafe, bufsize, default.to_unsafe))
      buffer
    end

    def wc_get_virtual_domain_bool(domain : String, section : String, key : String, default : Bool) : Bool
      bval_ptr = Pointer(LibC::BOOL).malloc(sizeof(LibC::BOOL))
      cbool(C.WcGetVirtualDomainBool(domain.to_unsafe, section.to_unsafe, key.to_unsafe, bval_ptr, default))
      bval_ptr.value
    end

    def wc_get_virtual_domain_var(domain : String, section : String, key : String, default : String, bufsize : LibC::DWORD) : String
      buffer = "\0" * bufsize.to_i
      cbool(C.WcGetVirtualDomainVar(domain.to_unsafe, section.to_unsafe, key.to_unsafe, buffer.to_unsafe, bufsize, default.to_unsafe))
      buffer
    end

    def wc_set_connection_status(activity : String) : Bool
      cbool(C.WcSetConnectionStatus(activity.to_unsafe))
    end

    def wc_get_wildcat_server_guid : WCL::WildcatServerGuid
      wg_ptr = Pointer(WCL::WildcatServerGuid).malloc(sizeof(WCL::WildcatServerGuid))
      cbool(C.WcGetWildcatServerGuid(wg_ptr))
      wg_ptr.value
    end

    def wc_get_wildcat_queue_guid(qname : String) : WCL::WildcatServerGuid
      wg_ptr = Pointer(WCL::WildcatServerGuid).malloc(sizeof(WCL::WildcatServerGuid))
      cbool(C.WcGetWildcatQueueGuid(qname.to_unsafe, wg_ptr))
      wg_ptr.value
    end

    def wc_get_geo_ip(ip : String, lang : String) : WCL::WildcatGeoIP
      geoip_ptr = Pointer(WCL::WildcatGeoIP).malloc(sizeof(WCL::WildcatGeoIP))
      cbool(C.WcGetGeoIP(ip.to_unsafe, geoip_ptr, lang.to_unsafe))
      geoip_ptr.value
    end

    def open_channel(name : String) : LibC::DWORD
      C.OpenChannel(name.to_unsafe)
    end
    
    def close_channel(handle : LibC::DWORD) : Bool
      cbool(C.CloseChannel(handle))
    end

    def write_channel(handle : LibC::DWORD, destid : LibC::DWORD, userdata : LibC::DWORD, data : String) : Bool
      cbool(C.WriteChannel(handle, destid, userdata, data.to_unsafe, data.size))
    end

    def get_service_by_name(name : String) : WildcatService
      ptr = Pointer(WildcatService).malloc(sizeof(WildcatService))
      C.GetServiceByName(name.to_unsafe, ptr)
      ptr.value
    end

    def register_service(service : WildcatService) : Bool
      cbool(C.RegisterService(pointerof(service)))
    end

    def set_server_state(server : String, state : LibC::DWORD) : Bool
      cbool(C.SetServerState(server, state))
    end

    @[Link("wcsrv2x64")]
    lib C
      fun GetMakewild(mw : WCL::MakeWild*) : LibC::BOOL
      fun GetMakewildEx(szDomain : LibC::Char*, setDomain : LibC::BOOL, mw : WCL::MakeWild*) : LibC::BOOL
      fun WildcatServerConnect(parent : LibC::HANDLE) : LibC::BOOL
      fun WildcatServerCreateContext : LibC::BOOL
      fun LoginSystem : LibC::BOOL
      fun LogoutUser : LibC::BOOL
      fun WildcatLoggedIn(user : WCL::User*) : LibC::BOOL
      fun WildcatServerDeleteContext : LibC::BOOL
      fun WcGetServerPlatform : LibC::DWORD
      
      fun GetWildcatVersion : LibC::DWORD
      fun GetWildcatBuild : LibC::DWORD
      
      fun WcGetServerVersion : LibC::DWORD
      fun WcGetServerBuild : LibC::DWORD
      fun WildcatServerConnectSpecific(parent : LibC::HANDLE, computername : LibC::Char*) : LibC::BOOL
      fun WildcatServerConnectLocal(parent : LibC::HANDLE) : LibC::BOOL
      fun WildcatServerDialog(parent : LibC::HANDLE, computername : LibC::Char*, namesize : LibC::DWORD) : LibC::BOOL
      fun SetWildcatErrorMode(verbose : LibC::BOOL) : LibC::BOOL
      fun WildcatServerShutdown(pwd : LibC::Char*, force : LibC::BOOL) : LibC::BOOL
      fun GetConnectedServer(computername : LibC::Char*, namesize : LibC::DWORD) : LibC::BOOL
      fun WildcatServerCreateContextFromHandle(context : LibC::DWORD) : LibC::BOOL
      fun WildcatServerCreateContextFromChallenge(challenge : LibC::Char*) : LibC::BOOL
      fun GetWildcatServerContextHandle : LibC::DWORD
      fun SetupWildcatCallback(cbproc : WCL::WildcatCallback, userdata : LibC::DWORD) : LibC::BOOL
      fun GrantThreadAccess(tid : LibC::DWORD) : LibC::BOOL
      fun GetWildcatThreadContext : LibC::DWORD
      fun SetWildcatThreadContext(context : LibC::DWORD) : LibC::BOOL
      fun GetNode : LibC::DWORD
      fun SetNodeStatus(nodestatus : LibC::DWORD) : LibC::BOOL
      fun GetComputerConfig(cc : WCL::ComputerConfig*) : LibC::BOOL
      fun GetChallengeString(buf : LibC::Char*, bufsize : LibC::DWORD) : LibC::BOOL
      fun LookupName(name : LibC::Char*, uinfo : WCL::UserInfo*) : LibC::BOOL
      fun AllocateNode(node : LibC::DWORD, calltype : LibC::DWORD, speed : LibC::Char*) : LibC::BOOL
      fun LoginUser(userid : LibC::DWORD, password : LibC::Char*, user : WCL::User*) : LibC::BOOL
      fun LoginUserEx(userid : LibC::DWORD, password : LibC::Char*, calltype : LibC::DWORD, speed : LibC::Char*, user : WCL::User*) : LibC::BOOL
      fun LoginRadiusUser(userid : LibC::DWORD, chapid : LibC::BYTE, challenge : LibC::BYTE*, challengesize : LibC::DWORD, challresponse : LibC::BYTE*, user : WCL::User*) : LibC::BOOL
      fun GetUsersOnline : LibC::DWORD
      fun GetProfileObjectFlags(profile : LibC::Char*, objectid : LibC::DWORD) : LibC::DWORD
      fun WcCloseHandle(handle : WCL::WCHANDLE) : LibC::BOOL
      fun WcCreateDirectory(dirname : LibC::Char*) : LibC::BOOL
      fun WcRemoveDirectory(dirname : LibC::Char*) : LibC::BOOL
      fun WcCreateFile(fn : LibC::Char*, access : LibC::DWORD, share : LibC::DWORD, create : LibC::DWORD) : WCL::WCHANDLE
      fun WcDeleteFile(fn : LibC::Char*) : LibC::BOOL
      fun WcExistFile(fn : LibC::Char*) : LibC::BOOL
      fun WcFindFirstFile(fn : LibC::Char*, fd : WCL::Win32FindDataA) : WCL::WCHANDLE
      fun WcFindNextFile(handle : WCL::WCHANDLE, fd : WCL::Win32FindDataA) : LibC::BOOL
      fun WcFindClose(handle : WCL::WCHANDLE) : LibC::BOOL
      fun WcGetFileSize(handle : WCL::WCHANDLE) : LibC::DWORD
      fun WcGetFileTime(handle : WCL::WCHANDLE, ft : WCL::FILETIME*) : LibC::BOOL
      fun WcGetFileTimeByName(fn : LibC::Char*, ft : WCL::FILETIME*) : LibC::BOOL
      fun WcMoveFile(src : LibC::Char*, dst : LibC::Char*) : LibC::BOOL
      fun WcReadFile(handle : WCL::WCHANDLE, buf : Void*, requested : LibC::DWORD, bytesread : LibC::DWORD*) : LibC::BOOL
      fun WcReadLine(handle : WCL::WCHANDLE, buf : LibC::Char*, bufsize : LibC::DWORD) : LibC::BOOL
      fun WcSetEndOfFile(handle : WCL::WCHANDLE) : LibC::BOOL
      fun WcSetFilePointer(handle : WCL::WCHANDLE, distance : LibC::LONG, method : LibC::DWORD) : LibC::DWORD
      fun WcSetFileTime(handle : WCL::WCHANDLE, ft : WCL::FILETIME*) : LibC::BOOL
      fun WcWriteFile(handle : WCL::WCHANDLE, buf : Void*, requested : LibC::DWORD, byteswritten : LibC::DWORD*) : LibC::BOOL
      fun WcRenameFile(src : LibC::Char*, dst : LibC::Char*) : LibC::BOOL
      fun WcResolvePathName(wfname : LibC::Char*, access : LibC::DWORD, share : LibC::DWORD, create : LibC::DWORD, dest : LibC::Char*, destsize : LibC::DWORD) : LibC::BOOL
      fun GetConnectionId : LibC::DWORD
      fun GetTotalCalls(increement : LibC::BOOL) : LibC::DWORD
      fun GetText(fn : LibC::Char*, buf : LibC::Char*, bufsize : LibC::DWORD, retsize : LibC::DWORD) : LibC::BOOL
      fun GetObjectFlags(objectid : LibC::DWORD) : LibC::DWORD
      fun GetMultipleObjectFlags(objectid : Pointer(LibC::DWORD), count : LibC::DWORD, flags : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetObjectById(objectid : LibC::DWORD, objectname : Pointer(WCL::ObjectName)) : LibC::BOOL
      fun GetMultipleObjectsById(objectid : Pointer(LibC::DWORD), count : LibC::DWORD, objectname : Pointer(WCL::ObjectName)) : LibC::BOOL
      fun GetObjectByName(classid : LibC::DWORD, name : LibC::Char*, objectname : Pointer(WCL::ObjectName), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetNextObjectByName(objectname : Pointer(WCL::ObjectName), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetStringObjectId(objectclass : LibC::DWORD, name : LibC::Char*) : LibC::DWORD
      fun GetStringObjectFlags(objectclass : LibC::DWORD, name : LibC::Char*) : LibC::DWORD
      fun GetSecurityProfileCount : LibC::DWORD
      fun GetSecurityProfileNames(count : LibC::DWORD, names : Pointer(LibC::Char)) : LibC::BOOL
      fun GetSecurityProfileByIndex(index : LibC::DWORD, profile : Pointer(WCL::SecurityProfile)) : LibC::BOOL
      fun GetSecurityProfileByName(name : LibC::Char*, profile : Pointer(WCL::SecurityProfile)) : LibC::BOOL
      fun GetAccessProfileCount : LibC::DWORD
      fun GetAccessProfileNames(count : LibC::DWORD, names : Pointer(LibC::Char)) : LibC::BOOL
      fun GetAccessProfileName(index : LibC::DWORD, name : Pointer(LibC::Char)) : LibC::BOOL
      fun GetConferenceCount : LibC::DWORD
      fun GetConfDesc(conference : LibC::DWORD, cd : Pointer(WCL::ConfDesc)) : LibC::BOOL
      fun GetConferenceGroupCount : LibC::DWORD
      fun GetConferenceGroup(index : LibC::DWORD, cg : Pointer(WCL::ConferenceGroup)) : LibC::BOOL
      fun GetFileGroupCount : LibC::DWORD
      fun GetFileGroup(index : LibC::DWORD, fg : Pointer(WCL::FileGroup)) : LibC::BOOL
      fun GetDoorCount : LibC::DWORD
      fun GetDoor(index : LibC::DWORD, di : Pointer(WCL::DoorInfo)) : LibC::BOOL
      fun GetLanguageCount : LibC::DWORD
      fun GetLanguage(index : LibC::DWORD, li : Pointer(WCL::LanguageInfo)) : LibC::BOOL
      fun GetModemProfile(name : LibC::Char*, mp : Pointer(WCL::ModemProfile)) : LibC::BOOL
      fun GetNodeCount : LibC::DWORD
      fun GetMaximumUserCount : LibC::DWORD
      fun GetNodeConfig(node : LibC::DWORD, nc : Pointer(WCL::NodeConfig)) : LibC::BOOL
      fun GetNodeInfo(node : LibC::DWORD, ni : Pointer(WCL::NodeInfo)) : LibC::BOOL
      fun GetNodeInfoByConnectionId(id : LibC::DWORD, ni : Pointer(WCL::NodeInfo)) : LibC::BOOL
      fun GetNodeInfoByName(name : LibC::Char*, ni : Pointer(WCL::NodeInfo)) : LibC::BOOL
      fun GetNodeInfos(node : LibC::DWORD, count : LibC::DWORD, ni : Pointer(WCL::NodeInfo)) : LibC::BOOL
      fun SetNodeInfo(ni : Pointer(WCL::NodeInfo)) : LibC::BOOL
      fun SetNodeActivity(activity : LibC::Char*) : LibC::BOOL
      fun SetServerState(port : LibC::Char*, state : LibC::DWORD) : LibC::BOOL
      fun GetServerState(index : LibC::DWORD, ss : Pointer(WCL::ServerState)) : LibC::BOOL
      fun SetNodeServerState(node : LibC::DWORD, state : LibC::DWORD) : LibC::BOOL
      fun AddFileRec(f : Pointer(WCL::FullFileRecord)) : LibC::BOOL
      fun DeleteFileRec(f : Pointer(WCL::FileRecord), disktoo : LibC::BOOL) : LibC::BOOL
      fun FileSearch(s : LibC::Char*, n : Pointer(LibC::DWORD), p : Pointer(Pointer(UInt64))) : LibC::BOOL
      fun GetFileRecAbsolute(ref : LibC::DWORD, f : Pointer(WCL::FileRecord)) : LibC::BOOL
      fun GetFileRecByNameArea(name : LibC::Char*, area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFileRecByAreaName(area : LibC::DWORD, name : LibC::Char*, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFileRecByAreaDate(area : LibC::DWORD, t : Pointer(WCL::FILETIME), f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFileRecByUploader(id : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFirstFileRec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFullFileRec(f : Pointer(WCL::FileRecord), full : Pointer(WCL::FullFileRecord)) : LibC::BOOL
      fun GetLastFileRec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetNextFileRec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetPrevFileRec(keynum : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetTotalFiles : LibC::DWORD
      fun GetTotalFilesInArea(area : LibC::DWORD) : LibC::DWORD
      fun GetTotalFilesInGroup(group : LibC::DWORD) : LibC::DWORD
      fun IncrementDownloadCount(f : Pointer(WCL::FileRecord)) : LibC::BOOL
      fun SearchFileRecByNameArea(name : LibC::Char*, area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchFileRecByAreaName(area : LibC::DWORD, name : LibC::Char*, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchFileRecByAreaDate(area : LibC::DWORD, t : Pointer(WCL::FILETIME), f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchFileRecByDateArea(t : Pointer(WCL::FILETIME), area : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchFileRecByUploader(id : LibC::DWORD, f : Pointer(WCL::FileRecord), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun UpdateFileRec(f : Pointer(WCL::FileRecord)) : LibC::BOOL
      fun UpdateFullFileRec(f : Pointer(WCL::FullFileRecord)) : LibC::BOOL
      fun AddMessage(msg : Pointer(WCL::MsgHeader), text : LibC::Char*) : LibC::BOOL
      fun DeleteMessage(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun GetHighMessageNumber(conf : LibC::DWORD) : LibC::DWORD
      fun GetLowMessageNumber(conf : LibC::DWORD) : LibC::DWORD
      fun GetMessageById(conf : LibC::DWORD, msgid : LibC::DWORD, msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun GetMsgIdFromNumber(conf : LibC::DWORD, number : LibC::DWORD) : LibC::DWORD
      fun GetMsgNumberFromId(conf : LibC::DWORD, msgid : LibC::DWORD) : LibC::DWORD
      fun GetNextMessage(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun GetPrevMessage(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun GetTotalMessages : LibC::DWORD
      fun GetTotalMessagesInConference(conf : LibC::DWORD) : LibC::DWORD
      fun GetTotalMessagesInGroup(group : LibC::DWORD) : LibC::DWORD
      fun IncrementReplyCount(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun IncrementReadCount(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun MarkMessageRead(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun MessageSearch(conf : LibC::DWORD, msgid : LibC::DWORD, msflags : LibC::DWORD, text : LibC::Char*, msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun SearchMessageById(conf : LibC::DWORD, msgid : LibC::DWORD, msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun SetMessagePrivate(msg : Pointer(WCL::MsgHeader), pvt : LibC::BOOL) : LibC::BOOL
      fun UpdateMessageFidoInfo(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL

      fun GetHighMessageIds(count : LibC::DWORD, conferences : Pointer(LibC::DWORD), ids : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SetMessageExported(msg : Pointer(WCL::MsgHeader), exported : LibC::BOOL) : LibC::BOOL
      fun AddNewUser(u : Pointer(WCL::User)) : LibC::BOOL
      fun DeleteOtherUser(u : Pointer(WCL::User)) : LibC::BOOL
      fun GetUserById(id : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetUserByLastName(name : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetUserByName(name : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetUserBySecurity(security : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetUserByLastCall(ft : Pointer(WCL::FILETIME), u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetUserVariable(id : LibC::DWORD, section : LibC::Char*, key : LibC::Char*, def : LibC::Char*, dest : LibC::Char*, destsize : LibC::DWORD) : LibC::BOOL
      fun GetUserVariables(id : LibC::DWORD, buffer : Pointer(Void), requested : LibC::DWORD, read : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetFirstUser(keynum : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetLastUser(keynum : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetNextUser(keynum : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetPrevUser(keynum : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetTotalUsers : LibC::DWORD
      fun SearchUserById(id : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchUserByLastName(name : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchUserByName(name : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchUserBySecurity(security : LibC::Char*, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SearchUserByLastCall(ft : Pointer(WCL::FILETIME), u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SetUserVariable(id : LibC::DWORD, section : LibC::Char*, key : LibC::Char*, data : LibC::Char*) : LibC::BOOL
      fun UpdateUser(u : Pointer(WCL::User)) : LibC::BOOL
      fun GetEffectiveConferenceGroupCount : LibC::DWORD
      fun GetEffectiveConferenceCount(group : LibC::DWORD, flags : LibC::DWORD) : LibC::DWORD
      fun GetFirstConference(group : LibC::DWORD, flags : LibC::DWORD) : LibC::LONG
      fun GetLastConference(group : LibC::DWORD, flags : LibC::DWORD) : LibC::LONG
      fun GetNextConference(group : LibC::DWORD, flags : LibC::DWORD, conf : LibC::DWORD) : LibC::LONG
      fun GetPrevConference(group : LibC::DWORD, flags : LibC::DWORD, conf : LibC::DWORD) : LibC::LONG
      fun GetFirstConferenceUnread : LibC::LONG
      fun GetNextConferenceUnread(conf : LibC::DWORD) : LibC::LONG
      fun GetPrevConferenceUnread(conf : LibC::DWORD) : LibC::LONG
      fun IsConferenceInGroup(group : LibC::DWORD, conf : LibC::DWORD) : LibC::BOOL
      fun GetEffectiveFileGroupCount : LibC::DWORD
      fun GetEffectiveFileAreaCount(group : LibC::DWORD, flags : LibC::DWORD) : LibC::DWORD
      fun GetFirstFileArea(group : LibC::DWORD, flags : LibC::DWORD) : LibC::LONG
      fun GetLastFileArea(group : LibC::DWORD, flags : LibC::DWORD) : LibC::LONG
      fun GetNextFileArea(group : LibC::DWORD, flags : LibC::DWORD, area : LibC::DWORD) : LibC::LONG
      fun GetPrevFileArea(group : LibC::DWORD, flags : LibC::DWORD, area : LibC::DWORD) : LibC::LONG
      fun IsFileAreaInGroup(group : LibC::DWORD, area : LibC::DWORD) : LibC::BOOL
      fun GetLastRead(conf : LibC::DWORD) : LibC::DWORD
      fun GetFirstUnread(conf : LibC::DWORD) : LibC::DWORD
      fun GetConfFlags(conf : LibC::DWORD) : LibC::DWORD
      fun SetLastRead(conf : LibC::DWORD, lastread : LibC::DWORD) : LibC::BOOL
      fun SetConfFlags(conf : LibC::DWORD, flags : LibC::DWORD) : LibC::BOOL
      fun GetUserLastRead(userid : LibC::DWORD, conf : LibC::DWORD) : LibC::DWORD
      fun GetUserFirstUnread(userid : LibC::DWORD, conf : LibC::DWORD) : LibC::DWORD
      fun GetUserConfFlags(userid : LibC::DWORD, conf : LibC::DWORD) : LibC::DWORD
      fun SetUserLastRead(userid : LibC::DWORD, conf : LibC::DWORD, lastread : LibC::DWORD) : LibC::BOOL
      fun SetUserConfFlags(userid : LibC::DWORD, conf : LibC::DWORD, flags : LibC::DWORD) : LibC::BOOL
      fun WriteLogEntry(fname : LibC::Char*, text : LibC::Char*) : LibC::BOOL
      fun WriteActivityLogEntry(text : LibC::Char*) : LibC::BOOL
      fun SpellCheckLine(s : LibC::Char*, startpos : LibC::DWORD, badpos : Pointer(LibC::DWORD), badlen : Pointer(LibC::DWORD)) : LibC::BOOL
      fun SpellCheckSuggest(s : LibC::Char*, sl : Pointer(WCL::SpellSuggestList)) : LibC::DWORD
      fun SpellCheckAddWord(s : LibC::Char*) : LibC::BOOL
      fun OpenChannel(name : LibC::Char*) : LibC::DWORD
      fun CloseChannel(chandle : LibC::DWORD) : LibC::BOOL
      fun WriteChannel(chandle : LibC::DWORD, destid : LibC::DWORD, userdata : LibC::DWORD, data : Pointer(Void), datasize : LibC::DWORD) : LibC::BOOL
      fun GetQwkBaudLimits(perpacket : Pointer(LibC::DWORD), perconference : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetServiceByName(name : LibC::Char*, service : Pointer(WCL::WildcatService)) : LibC::BOOL
      fun RegisterService(service : Pointer(WCL::WildcatService)) : LibC::BOOL
      fun CheckNetworkAddress(clientip : LibC::DWORD) : LibC::BOOL
      fun SubmitCopyRequest(id : LibC::DWORD, fn : LibC::Char*) : LibC::BOOL
      fun GetNextCopyRequest : LibC::DWORD
      fun RemoveCopyRequest(id : LibC::DWORD) : LibC::BOOL
      fun GetConnectionInfo(connectionid : LibC::DWORD, ci : Pointer(WCL::ConnectionInfo)) : LibC::BOOL
      fun AdjustUserTime(minutes : LibC::LONG) : LibC::BOOL
      fun RegisterPPPAddress(address : LibC::DWORD) : LibC::BOOL
      fun UnregisterPPPAddress(address : LibC::DWORD) : LibC::BOOL
      fun GetValidPPPAddresses(addrs : Pointer(LibC::DWORD), addrlen : Pointer(LibC::DWORD)) : LibC::BOOL
      fun GetWildcatServerInfo(si : Pointer(WCL::WildcatServerInfo)) : LibC::BOOL
      fun GetUserByKeyIndex(keynum : LibC::DWORD, idx : LibC::DWORD, u : Pointer(WCL::User), tid : Pointer(LibC::DWORD)) : LibC::BOOL
      fun CheckClientAddress(clientip : LibC::DWORD, szIPFile : LibC::Char*) : LibC::BOOL
      fun CheckClientAddressEx(clientip : LibC::DWORD, szIPFile : LibC::Char*) : LibC::DWORD
      fun CheckMailIntegrity(conf : LibC::DWORD, level : LibC::DWORD) : LibC::BOOL
      fun UpdateMessageFlags(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun DeleteMessageAttachment(msg : Pointer(WCL::MsgHeader)) : LibC::BOOL
      fun GetComputerConfigEx(szComputerName : LibC::Char*, cc : Pointer(WCL::ComputerConfig)) : LibC::BOOL
      fun ProfileDateToFileDate(szInt64 : LibC::Char*, ft : Pointer(WCL::FILETIME)) : LibC::BOOL
      fun GetUserVariableDate(id : LibC::DWORD, section : LibC::Char*, key : LibC::Char*, ft : Pointer(WCL::FILETIME)) : LibC::BOOL
      fun GetUserProfileDate(id : LibC::DWORD, key : LibC::Char*, ft : Pointer(WCL::FILETIME)) : LibC::BOOL
      fun GetUserProfileDateStr(id : LibC::DWORD, key : LibC::Char*, format : LibC::Char*, dest : LibC::Char*, destsize : LibC::DWORD) : LibC::BOOL
      fun GetUserProfileTimeStr(id : LibC::DWORD, key : LibC::Char*, format : LibC::Char*, dest : LibC::Char*, destsize : LibC::DWORD) : LibC::BOOL
      fun SetUserVariableDate(id : LibC::DWORD, section : LibC::Char*, key : LibC::Char*, ft : Pointer(WCL::FILETIME)) : LibC::BOOL
      fun SetUserProfileDate(id : LibC::DWORD, key : LibC::Char*, ft : Pointer(WCL::FILETIME)) : LibC::BOOL
      fun SetUserProfileSystemTime(id : LibC::DWORD, key : LibC::Char*, st : Pointer(WCL::SYSTEMTIME)) : LibC::BOOL
      fun GetUserProfileBool(id : LibC::DWORD, key : LibC::Char*, flag : Pointer(LibC::BOOL)) : LibC::BOOL
      fun SetUserProfileBool(id : LibC::DWORD, key : LibC::Char*, flag : LibC::BOOL) : LibC::BOOL
      fun wcCopyFileToTemp(area : LibC::DWORD, fn : LibC::Char*) : LibC::BOOL
      fun UpdateUserEx(user : Pointer(WCL::User), oldpwd : LibC::Char*, newpwd : LibC::Char*) : LibC::BOOL
      fun WcSASLGetMethodName(szMethod : LibC::Char*, dwSize : LibC::DWORD, dwIndex : LibC::DWORD) : LibC::BOOL
      fun WcSASLAuthenticateUser(ctx : Pointer(WCL::WildcatSASLContext), szFromClient : LibC::Char*, szResponse : LibC::Char*, dwResponseSize : LibC::DWORD, u : Pointer(WCL::User)) : LibC::DWORD
      fun WcSASLAuthenticateUserEx(ctx : Pointer(WCL::WildcatSASLContext), szFromClient : LibC::Char*, szResponse : LibC::Char*, dwResponseSize : LibC::DWORD, dwCallType : LibC::DWORD, szSpeed : LibC::Char*, u : Pointer(WCL::User)) : LibC::DWORD
      fun WcSASLCheckAuthentication(ctx : Pointer(WCL::WildcatSASLContext), szFromClient : LibC::Char*, szResponse : LibC::Char*, dwResponseSize : LibC::DWORD) : LibC::DWORD
      fun WcGetProcessTimes(pt : Pointer(WCL::WildcatProcessTimes)) : LibC::BOOL


      fun SetContextPeerAddress(address : LibC::DWORD) : LibC::BOOL
      fun WcGetPrivateProfileString(sect : LibC::Char*, key : LibC::Char*, defvalue : LibC::Char*, dest : LibC::Char*, destsize : Pointer(LibC::DWORD), inifile : LibC::Char*) : LibC::BOOL
      fun WcWritePrivateProfileString(sect : LibC::Char*, key : LibC::Char*, value : LibC::Char*, inifile : LibC::Char*) : LibC::BOOL
      fun WcGetPrivateProfileSection(sect : LibC::Char*, dest : LibC::Char*, destsize : Pointer(LibC::DWORD), inifile : LibC::Char*) : LibC::BOOL
      fun WcCreateFileEx(fn : LibC::Char*, access : LibC::DWORD, sharemode : LibC::DWORD, create : LibC::DWORD, pwcofi : Pointer(WCL::OpenFileInfo)) : WCL::WCHANDLE
      fun GetConnectionInfoFromChallenge(challenge : LibC::Char*, ci : Pointer(WCL::ConnectionInfo)) : LibC::BOOL
      fun DeleteUserVariable(id : LibC::DWORD, section : LibC::Char*, key : LibC::Char*) : LibC::BOOL
      fun WcCheckUserName(szName : LibC::Char*) : LibC::BOOL
      fun WcSetMessageAttachment(msg : Pointer(WCL::MsgHeader), szFileName : LibC::Char*, bCopyTo : LibC::BOOL) : LibC::BOOL
      fun WcLocalCopyToServer(szLocal : LibC::Char*, szServer : LibC::Char*, msSlice : Int32) : LibC::BOOL
      fun GetMakewildEx(szDomain : LibC::Char*, setdomain : LibC::BOOL, mw : Pointer(WCL::MakeWild)) : LibC::BOOL
      fun WcSetCurrentDomain(szDomain : LibC::Char*) : LibC::BOOL
      fun WcGetCurrentDomain(szDomain : LibC::Char*, dwSize : LibC::DWORD) : LibC::BOOL
      fun WcGetDefaultDomain(szBuffer : LibC::Char*, dwSize : LibC::DWORD) : LibC::BOOL
      fun WcGetDomainCount : LibC::DWORD
      fun WcGetDomain(index : LibC::DWORD, szDomain : LibC::Char*, dwSize : LibC::DWORD) : LibC::BOOL
      fun WcGetDomainConfigString(szDomain : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, szValue : LibC::Char*, dwSize : LibC::DWORD, szDefault : LibC::Char*) : LibC::BOOL
      fun WcGetDomainConfigBool(szDomain : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, bVal : Pointer(LibC::BOOL), bDef : LibC::BOOL) : LibC::BOOL
      fun WcGetDomainConfigInt(szDomain : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, dwValue : Pointer(LibC::DWORD), dwDefault : LibC::DWORD) : LibC::BOOL
      fun WcGetDomainConfigSection(szDomain : LibC::Char*, szSection : LibC::Char*, szBuffer : LibC::Char*, dwBufSize : LibC::DWORD, dwSize : Pointer(LibC::DWORD)) : LibC::BOOL
      fun WcGetHttpConfigVar(szSection : LibC::Char*, szKey : LibC::Char*, szValue : LibC::Char*, dwSize : LibC::DWORD, szDefault : LibC::Char*) : LibC::BOOL
      fun WcGetConfigFileVar(szFile : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, szValue : LibC::Char*, dwSize : LibC::DWORD, szDefault : LibC::Char*) : LibC::BOOL
      fun WcGetVirtualDomainBool(szDomain : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, bVal : Pointer(LibC::BOOL), bDef : LibC::BOOL) : LibC::BOOL
      fun WcGetVirtualDomainVar(szDomain : LibC::Char*, szSection : LibC::Char*, szKey : LibC::Char*, szValue : LibC::Char*, dwSize : LibC::DWORD, szDefault : LibC::Char*) : LibC::BOOL
      fun WcSetConnectionStatus(activity : LibC::Char*) : LibC::BOOL
      fun WcGetWildcatServerGuid(wg : Pointer(WCL::WildcatServerGuid)) : LibC::BOOL
      fun WcGetWildcatQueueGuid(qname : LibC::Char*, wg : Pointer(WCL::WildcatServerGuid)) : LibC::BOOL
      fun WcGetGeoIP(ip : LibC::Char*, geoip : Pointer(WCL::WildcatGeoIP), lang : LibC::Char*) : LibC::BOOL

    end
  end
end