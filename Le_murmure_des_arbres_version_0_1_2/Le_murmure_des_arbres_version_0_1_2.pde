import android.os.StrictMode;
import oscP5.*;
import netP5.*;
import controlP5.*; //librairies nécessaire à notre programme
ControlP5 controlP5;
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean overButton = false;
int y_mixing_1 = 140;
int y_Pitch_1 = y_mixing_1 + 500 + 60;
int y_Sound_1 = y_Pitch_1 + 150 + 60;

int y_mixing_2 = y_Sound_1 + 150 + 60;
int y_Pitch_2 = y_mixing_2 + 500 + 60;
int y_Sound_2 = y_Pitch_2 + 150 + 60;

int colonne_1 = 20 ;
int colonne_2 = 190 ; 
int colonne_3 = 360 ; 
int colonne_4 = 530 ; 
int colonne_5 = 700 ; 
int colonne_6 = 870 ; 
int colonne_7 = colonne_6 + 150 ;

color couleur_active = color(138, 176, 92);
color couleur_premier_plan = color(39,109,35);

color couleur_de_fond_slider = color(189, 255, 0);

color couleur_active_pitch = color(76, 187, 23);
color couleur_premier_plan_pitch = color(39,109,35);
color couleur_de_fond_pitch = color(128,128,128);

color couleur_active_sound = color(151, 186, 112);
boolean slider_n = false;

//void setup est la partie où nous initialisons notre code avant de le faire tourner
void setup() {
  fullScreen();
  orientation(PORTRAIT); //plein écran en mode portrait
  smooth();
  frameRate(60); //vitesse à laquelle l 'écran s'actualise (ici 60 images / seconde)
  //création d'une nouvelle instance oscP5, c'est ce qui va nous permettre de communiquer avec pd
  oscP5 = new OscP5(this, 10000 ); //le port 12000 est celui sur lequel le routeur écoute
  myRemoteLocation = new NetAddress("80.12.93.238", 10000); //adresse ip et port d envoi
  //myRemoteLocation = new NetAddress("192.168.10.139", 10000); //adresse ip et port d envoi
  
  controlP5 = new ControlP5(this); //création d'un nouveau controller
 
  controlP5.addSlider("slider1",0,127).setPosition(colonne_1, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider);
  controlP5.addSlider("slider2",0,127).setPosition(colonne_2, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider);  
  controlP5.addSlider("slider3",0,127).setPosition(colonne_3, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider4",0,127).setPosition(colonne_4, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider5",0,127).setPosition(colonne_5, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider6",0,127).setPosition(colonne_6, y_mixing_1).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider);

  controlP5.addToggle("toggle1",false).setPosition(colonne_1, y_Pitch_1).setSize(150,150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle2",false).setPosition(colonne_2, y_Pitch_1).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle3",false).setPosition(colonne_3, y_Pitch_1).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle4",false).setPosition(colonne_4, y_Pitch_1).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle5",false).setPosition(colonne_5, y_Pitch_1).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle6",false).setPosition(colonne_6, y_Pitch_1).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
     
  controlP5.addBang("bang1").setPosition(colonne_1, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang2").setPosition(colonne_2, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang3").setPosition(colonne_3, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang4").setPosition(colonne_4, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang5").setPosition(colonne_5, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang6").setPosition(colonne_6, y_Sound_1).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
 
  controlP5.addSlider("slider7",0,127).setPosition(colonne_1, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider8",0,127).setPosition(colonne_2, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider);  
  controlP5.addSlider("slider9",0,127).setPosition(colonne_3, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider10",0,127).setPosition(colonne_4, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider11",0,127).setPosition(colonne_5, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider); 
  controlP5.addSlider("slider12",0,127).setPosition(colonne_6, y_mixing_2).setSize(150, 500).setColorActive(couleur_active).setColorForeground(couleur_premier_plan).setColorBackground(couleur_de_fond_slider);
  
  controlP5.addToggle("toggle7",false).setPosition(colonne_1, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle8",false).setPosition(colonne_2, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle9",false).setPosition(colonne_3, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle10",false).setPosition(colonne_4, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle11",false).setPosition(colonne_5, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  controlP5.addToggle("toggle12",false).setPosition(colonne_6, y_Pitch_2).setSize(150, 150).setColorActive(couleur_active_pitch).setColorForeground(couleur_premier_plan_pitch).setColorBackground(couleur_de_fond_pitch); 
  
  controlP5.addBang("bang7").setPosition(colonne_1, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang8").setPosition(colonne_2, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang9").setPosition(colonne_3, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang10").setPosition(colonne_4, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang11").setPosition(colonne_5, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);
  controlP5.addBang("bang12").setPosition(colonne_6, y_Sound_2).setSize(150, 150).setColorActive(couleur_active_sound).setColorForeground(couleur_premier_plan);

}

void controlEvent(ControlEvent theEvent) {
  StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
  StrictMode.setThreadPolicy(policy);
   if(theEvent.isController()) { 
     print("control event from : "+theEvent.getController().getName());
     println(", value : "+theEvent.getController().getValue());
   
   if(theEvent.getController().getName()=="slider1") {
     if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/1"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
       }
   }
    if(theEvent.getController().getName()=="slider2") {
      if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/2"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider3") {
      if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/3"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider4") {
      if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/4"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider5") {
      if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/5"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider6") {
      if(slider_n == true){
        OscMessage myMessage = new OscMessage("/slider/6"); //on donne ici un nom à notre message
        myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
        oscP5.send(myMessage, myRemoteLocation);
      }
    
   }
    if(theEvent.getController().getName()=="slider7") {
      if(slider_n == true){
      OscMessage myMessage = new OscMessage("/slider/7"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider8") {
    if(slider_n == true){
      OscMessage myMessage = new OscMessage("/slider/8"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
    }
   }
    if(theEvent.getController().getName()=="slider9") {
    if(slider_n == true){
      OscMessage myMessage = new OscMessage("/slider/9"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
    }
   }
    if(theEvent.getController().getName()=="slider10") {
      if(slider_n == true){
      OscMessage myMessage = new OscMessage("/slider/10"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider11") {
      if(slider_n == true){
      OscMessage myMessage = new OscMessage("/slider/11"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
      }
   }
    if(theEvent.getController().getName()=="slider12") {
      if(slider_n){
      OscMessage myMessage = new OscMessage("/slider/12"); //on donne ici un nom à notre message
      myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
      oscP5.send(myMessage, myRemoteLocation);
      }
      slider_n = true;
   }
   if(theEvent.getController().getName()=="toggle1") {
    OscMessage myMessage = new OscMessage("/toggle/1"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
   if(theEvent.getController().getName()=="toggle2") {
    OscMessage myMessage = new OscMessage("/toggle/2"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle3") {
    OscMessage myMessage = new OscMessage("/toggle/3"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle4") {
    OscMessage myMessage = new OscMessage("/toggle/4"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle5") {
    OscMessage myMessage = new OscMessage("/toggle/5"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle6") {
    OscMessage myMessage = new OscMessage("/toggle/6"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle7") {
    OscMessage myMessage = new OscMessage("/toggle/7"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle8") {
    OscMessage myMessage = new OscMessage("/toggle/8"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle9") {
    OscMessage myMessage = new OscMessage("/toggle/9"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle10") {
    OscMessage myMessage = new OscMessage("/toggle/10"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle11") {
    OscMessage myMessage = new OscMessage("/toggle/11"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle12") {
    OscMessage myMessage = new OscMessage("/toggle/12"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang1") {
    OscMessage myMessage = new OscMessage("/bang/1"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang2") {
    OscMessage myMessage = new OscMessage("/bang/2"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle3") {
    OscMessage myMessage = new OscMessage("/bang/3"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="toggle4") {
    OscMessage myMessage = new OscMessage("/bang/4"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang5") {
    OscMessage myMessage = new OscMessage("/bang/5"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang6") {
    OscMessage myMessage = new OscMessage("/bang/6"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang7") {
    OscMessage myMessage = new OscMessage("/bang/7"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang8") {
    OscMessage myMessage = new OscMessage("/bang/8"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang9") {
    OscMessage myMessage = new OscMessage("/bang/9"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang10") {
    OscMessage myMessage = new OscMessage("/bang/10"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang11") {
    OscMessage myMessage = new OscMessage("/bang/11"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
if(theEvent.getController().getName()=="bang12") {
    OscMessage myMessage = new OscMessage("/bang/12"); //on donne ici un nom à notre message
    myMessage.add(int (theEvent.getController().getValue())); // on lui donne ici une valeur (contenu du mail)
    oscP5.send(myMessage, myRemoteLocation);
   }
 }
}

void draw() {  
  background(34,73,18); // couleur de fond de votre écran
  text();
  if (overButton == true) {
    fill(255);
  } else {
    noFill();
  }
  rect(colonne_1, y_Sound_2 + 150 + 30 + 50, 450, 120);
  line(colonne_2, y_Sound_2 + 150 + 30 + 50 + 100 , colonne_3, y_Sound_2 + 150 + 30 + 50 + 20);
  line(colonne_3 - 50,  y_Sound_2 + 150 + 30 + 50 + 20, colonne_3, y_Sound_2 + 150 + 30 + 50 + 20);
  line(colonne_3, y_Sound_2 + 150 + 30 + 50 + 20, colonne_3, y_Sound_2 + 150 + 30 + 50 + 20 + 50);
}
void mousePressed() {
  if (overButton) { 
    link("http://apo33.org:8000/arbres.ogg");
  }
}

void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  if (mouseX > colonne_1 && mouseX < colonne_1 + 450 && mouseY > y_Sound_2 + 150 + 30 + 50 && mouseY < y_Sound_2 + 150 + 30 + 50 + 120) {
    overButton = true;   
  } else {
    overButton = false;
  }
}
void text(){
  
  textSize(75); 
  text("Le murmure des arbres", 20,60); 
  textSize(80);
  text("APO33", 800, 80);  
  textSize(40); 
  text("version 0.1-2", 560, 95);  
  
  textSize(40); 
  text("Mixing 1", colonne_1,  y_mixing_1 - 20);
  line(colonne_2, y_mixing_1 - 30 , colonne_7, y_mixing_1 - 30);
  text("Pitch 1", 20,  y_Pitch_1 - 20 );  
  line(colonne_2, y_Pitch_1 - 30 , colonne_7, y_Pitch_1 - 30);
  text("Sound 1", 20,  y_Sound_1 - 20 );  
  line(colonne_2, y_Sound_1 - 30 , colonne_7, y_Sound_1 - 30);
  text("Mixing 2", 20,  y_mixing_2 - 20);
  line(colonne_2, y_mixing_2 - 30 , colonne_7, y_mixing_2 - 30);
  text("Pitch 2", 20,  y_Pitch_2 - 20 );  
  line(colonne_2, y_Pitch_2 - 30 , colonne_7, y_Pitch_2 - 30);
  text("Sound 2", 20,  y_Sound_2 - 20 );  
  line(colonne_2, y_Sound_2 - 30 , colonne_7, y_Sound_2 - 30);
  line(colonne_1, y_Sound_2 + 150 + 20 , colonne_7, y_Sound_2 + 150 + 20);

  textSize(35); 
  text("Listen Live here:", colonne_1,  y_Sound_2 + 150 + 60 );
  
  textSize(32); 
  text("Developed by Julien Ottavi, programmation by Max Siliphayvanh, visual by Jenny Pickett - artistic concept by OttaviPickett and Apo33" ,
  colonne_4  ,  y_Sound_2  + 150 + 30 , 570 , 180 );
  //rect(  colonne_4  ,  y_Sound_2  + 150 + 30 , 570 , 180 );
  line(colonne_4 - 20, y_Sound_2 + 150 + 30 , colonne_4 - 20, y_Sound_2 + 150 + 180 + 30);
  text("info: apo33.org", colonne_5,  y_Sound_2 + 150 + 180 + 30);

}
