require "../../src/wclib"

alias WCL = WcLib::LibWc
alias WCD = WcLib::Door32


def wprintf(fmt, *args)
  buf = sprintf(fmt, *args)
  WCD.doorWrite(buf)
end

if WCD.doorInitialize == WCL::FALSE
  sleep 5.seconds
  exit 1
end

WCL.wildcat_logged_in(out user)

wprintf("Welcome to Crystal DOOR32 Test, %s.\r\n\r\n", String.new(user.info.name.to_unsafe))
wprintf("Press ESC to exit.\r\n\r\n")

bDone = false
while !bDone
  msTimeout = 10000_u32

  case WCD::DoorEvent.from_value(WCL.wcDoorEvent(msTimeout))
  when WCD::DoorEvent::KEYBOARD
    c = 0_u8
    WCL.wcDoorRead(pointerof(c), 1_u32)
    bDone = true if c == 27_u8
    wprintf("%c", c) unless c == 0_u8
    wprintf("\r") if c == 13_u8
  when WCD::DoorEvent::OFFLINE
    bDone = true
  when WCD::DoorEvent::FAILED
    bDone = true
  when WCD::DoorEvent::TIMEOUT
    wprintf("*")
  end
end
wprintf("\r\n\r\nReturning to BBS...\r\n")
WCL.wcDoorShutdown
exit 0