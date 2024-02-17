import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;
import java.util.List;
import java.util.ArrayList;
import processing.net.*;

Info info;
SetName setName;
StartRoom startRoom;
CreateRoom createRoom;
JoinRoom joinRoom;
Game game;

boolean unmodefirePressed = false;
boolean updownPressed = false;
void keyPressCheck(){
  if(key >= 0 && key <= 127){
    unmodefirePressed = true;
  }
  else if(keyCode == UP || keyCode == DOWN){
    updownPressed = true;
  }
}
void keyReleaseCheck(){
  unmodefirePressed = false;
  updownPressed = false;
}