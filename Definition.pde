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
boolean unmodefirePressed = false;

void unmodefirePressed(){
  if(key >= 0 && key <= 127){
    unmodefirePressed = true;
  }
}

void unmodefireReleased(){
  unmodefirePressed = false;
}