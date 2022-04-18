/* ----------------------------------------------------------------------------------------------------
 * Livre Infini generator, 2016
 * Created: 01/01/16 by Bastien DIDIER
 * 
 * This sketch is used to generate the pdf file of the "Livre Infini" installation by Albertine Meunier
 * More info : https://www.albertinemeunier.net/livre-infini
 * 
 * Update: 04/18/22 Current V.1.0
 * ----------------------------------------------------------------------------------------------------
 */

import processing.pdf.*;
PGraphicsPDF pdf;

PImage[] id = new PImage[10];

int dpi = 72;
int pages = 100; //max: 1000

//Define A4 size
int width_px = mm2px(210, dpi); //210mm
int height_px = mm2px(297, dpi); //297mm

int SensorSize = mm2px(9, dpi); //9mm

int maring_left = (width_px - SensorSize) - mm2px(3, dpi);

int sensor_spacer = mm2px(2, dpi);
int maring_top_sensor1 = mm2px(5, dpi);
int maring_top_sensor2 = maring_top_sensor1 + SensorSize + sensor_spacer;
int maring_top_sensor3 = maring_top_sensor1 + SensorSize*2 + sensor_spacer*2;

void settings() {
  size(width_px, height_px);
}

void setup() { 
  smooth();
  pdf = (PGraphicsPDF) beginRecord(PDF, "livre-infini_" + dpi + "dpi_" + pages + "pages.pdf");
  for(int i=0; i<10; i++){
    id[i] = loadImage("id" + i + ".png");
  }
}

void draw(){
  background(255);
  fill(0);
  for(int a=0; a<(pages/100); a++){
    for(int b=0; b<10; b++){
      for(int c=0; c<10; c++){ 
        image(id[a], maring_left, maring_top_sensor1, SensorSize, SensorSize);
        image(id[b], maring_left, maring_top_sensor2, SensorSize, SensorSize);
        image(id[c], maring_left, maring_top_sensor3, SensorSize, SensorSize);
        pdf.nextPage();
      }
    }
  }
  endRecord();
  exit();
}

int mm2px(float mm, float dpi) {
  return ceil((mm / 25.4 * dpi));
}
