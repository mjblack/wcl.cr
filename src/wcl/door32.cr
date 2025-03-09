module WCL
  module Door32
    extend self

    enum DoorEvent
      FAILED = 0
      TIMEOUT = 1
      KEYBOARD = 2
      OFFLINE = 3
    end

    def doorInitialize : Bool
      cbool(C.wcDoorInitialize)
    end

    def doorShutdown : Bool
      cbool(C.wcDoorShutdown)
    end

    def doorWrite(str : String) : Bool
      data = str.to_unsafe
      size = str.size.to_u32
      cbool(C.wcDoorWrite(data, size))
    end

    def doorWrite(chars : Array(Chars)) : Bool
      data = chars.to_unsafe
      size = chars.size.to_u32
      cbool(C.wcDoorWrite(data, size))
    end

    def doorWrite(char : Char) : Bool
      data = char.to_unsafe
      size = 1_u32
      cbool(C.wcDoorWrite(data, size))
    end

    def doorRead(size : Int) : String
      data = Pointer(Void).malloc(size)
      num = C.wcDoorRead(data, size.to_u32)
      str = String.new(data.as(Pointer(UInt8)), num)
      str
    end

    def doorReadPeek(size : Int) : String
      data = Pointer(Void).malloc(size)
      num = C.wcDoorReadPeek(data, size.to_u32)
      str = String.new(data, num)
      str
    end

    def doorReady : Int
      C.wcDoorReady
    end

    def doorGetAvailableEventHandle : LibC::HANDLE
      C.wcDoorGetAvailableEventHandle
    end

    def doorGetOfflineEventHandle : LibC::HANDLE
      C.wcDoorGetOfflineEventHandle
    end

    def doorHangup : Bool
      cbool(C.wcDoorHangup)
    end

    def doorEvent(timeout : Int) : UInt32
      C.wcDoorEvent(timeout)
    end

    @[Link("wcdoor32x64")]
    lib C
      fun wcDoorInitialize : LibC::BOOL
      fun wcDoorShutdown : LibC::BOOL
      fun wcDoorWrite(chars : Void*, size : LibC::DWORD) : LibC::BOOL
      fun wcDoorRead(chars : Void*, size : LibC::DWORD) : LibC::DWORD
      fun wcDoorReadPeek(data : Void*, size : LibC::DWORD) : LibC::DWORD
      fun wcDoorReady : LibC::DWORD
      fun wcDoorGetAvailableEventHandle : LibC::HANDLE
      fun wcDoorGetOfflineEventHandle : LibC::HANDLE
      fun wcDoorHangup : LibC::BOOL
      fun wcDoorEvent(timeout : LibC::DWORD) : LibC::DWORD
    end
  end
end