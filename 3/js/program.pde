int resolutionWidth = 800;
int resolutionHeight = 550;


int sceneX, sceneY, chairX, chairY, chairHeight, keyboardX, keyboardY;
float chairBackAngle, headAngle, armAngle, legAngle, keyboardAngle;
int action, status, temp;
float ex,ey,er,el,es;
boolean controlPointsAppearance, drag;

PImage imgDesk2,imgDesk, imgChairBase, imgChairMain, imgChairBack, imgTorso, imgHead, imgArm, imgLeftArm, imgRightLeg, imgKeyboard, imgMouse, imgLeftLeg, imgDeskTrans;
PImage banner_down, play, play_over, restore, restore_over, banner_down_help;
PImage tip4, tip5, tip6, tip7, tip3, tip2,tip1,controlPointsAppear, controlPointsDisappear,controlPointsAppearOver,controlPointsDisappearOver;
int[] AllCorrect = new int[7];



void InitVars() {
	chairX = sceneX - 181;
	chairY = sceneY + 67;
	chairHeight = 0;
	chairBackAngle = 0;
	armAngle = 2.0;
	headAngle = -3.0;
	legAngle = -1.0;	
	keyboardX = 400;
	keyboardY = 305;
	keyboardAngle = 0;	
	controlPointsAppearance = false;
	drag = false;
	status = 0;
	action = 0;
	for(int i=0;i<7;i++)
		AllCorrect[i] = 0;
}


void setup() {

	size(resolutionWidth,resolutionHeight);	
	frameRate(60);         
	smooth(); 

	sceneX = 350;
	sceneY = 145;
	action = 0;	
	status = 0;
	InitVars();

	imgDesk = loadImage("images/desk.png");
	imgChairMain = loadImage("images/chair_main.png");
	imgChairBase = loadImage("images/chair_base.png");
	imgChairBack = loadImage("images/chair_back.png");
	imgTorso = loadImage("images/torso.png");
	imgHead = loadImage("images/head.png");
	imgArm = loadImage("images/arm.png");
	imgLeftArm = loadImage("images/left_arm.png");
	imgRightLeg = loadImage("images/right_leg.png");
	imgLeftLeg = loadImage("images/left_leg.png");
	imgKeyboard = loadImage("images/keyboard.png");
	imgMouse = loadImage("images/mouse.png");
	imgDeskTrans = loadImage("images/desk_trans.png");
	imgDesk2 = loadImage("images/desk2.png");
	
	banner_down = loadImage("images/bannerDown1.jpg");
	banner_down_help = loadImage("images/bannerDown4.jpg");
	play = loadImage("images/play.png");
	play_over = loadImage("images/play_over.png");
	restore = loadImage("images/restore.png");
	restore_over = loadImage("images/restore_over.png");
	tip3 = loadImage("images/tip3.jpg");
	tip4 = loadImage("images/tip4.jpg");
	tip5 = loadImage("images/tip5.jpg");
	tip6 = loadImage("images/tip6.jpg");
	tip7 = loadImage("images/tip7.jpg");
	tip2 = loadImage("images/tip2.jpg");
	tip1 = loadImage("images/tip1.jpg");
	controlPointsAppear = loadImage("images/controlPointsAppear.png");
	controlPointsAppearOver = loadImage("images/controlPointsAppearOver.png");
	controlPointsDisappear = loadImage("images/controlPointsDisappear.png");
	controlPointsDisappearOver = loadImage("images/controlPointsDisappearOver.png");
	drag = false;

	mouseX = 400;
	mouseY = 250;
    strokeWeight(4);
}


void drawChair(int x, int y) {
	
	pushMatrix();	
		translate(x + 51, y + 178 + chairHeight); 
		rotate(radians(chairBackAngle));
		image(imgChairBack, -36, -176);
	popMatrix();

	image(imgChairMain, x + 50, y + 143 + chairHeight);
	image(imgChairBase, x, y + 212);	
}



void dottedLine(float x1, float y1, float x2, float y2, float steps){
 for(int i=0; i<=steps; i++) {
   float x = lerp(x1, x2, i/steps);
   float y = lerp(y1, y2, i/steps);
   noStroke();
   fill(255,0,0);
   ellipse(x, y,4,4);   
 }
}


void drawHead() {
	pushMatrix();
		translate(55, -195);
		rotate(radians(headAngle));
		if(action == 4) dottedLine(60,-40,250,-40,10);
		image(imgHead, -35, -108);		
		stroke(0);				
	popMatrix();
}



void drawRightArm() {
	pushMatrix();
		translate(43, -148);		
		rotate(radians(armAngle));
		image(imgArm, -15, -29);
	popMatrix();
}


void drawLeftArm() {
	pushMatrix();
		translate(43, -148);		
		rotate(radians(armAngle));
		image(imgLeftArm, 38, 14);
	popMatrix();
}


void drawRightLeg() {
pushMatrix();
		translate(55, -35);		
		rotate(radians(legAngle));
		image(imgRightLeg, -46, -25);		
	popMatrix();
}


void drawLeftLeg() {
pushMatrix();
		translate(55, -35);		
		rotate(radians(legAngle));
		image(imgLeftLeg, -46, -40);		
	popMatrix();
}


void drawKeyboard() {
	pushMatrix();
		translate(keyboardX, keyboardY);		
		rotate(radians(keyboardAngle));
		image(imgKeyboard, -37, -21);
	popMatrix();
	image(imgMouse, keyboardX-10, keyboardY-13);	
}


void drawBoy(int x, int y) {			

	pushMatrix();
		translate(x + 51, y + 178 + chairHeight);
		rotate(radians(chairBackAngle));
		drawHead();		
		drawLeftArm();
		drawLeftLeg();
		image(imgTorso, 7, - 226);
		drawRightLeg();
		drawRightArm();				
	popMatrix();

}


void changeBoy() {
	chairX = int(random(20,220));
	chairHeight = int(random(0,21));
	chairBackAngle = int(random(-40,2));
	headAngle = int(random(-40,40));
	armAngle = int(random(-40,40));
	legAngle = int(random(-31,20));
	keyboardX = int(random(360,430));
	keyboardAngle = int(random(-40,40));
	for(int i=0;i<7;i++)
		AllCorrect[i] = 0;

}


void changeStatus(int s) {
	status = s;

	switch (status) {
		case 0:
			InitVars();
			banner_down = loadImage("images/bannerDown1.jpg");
		break;
		case 1:
			banner_down = loadImage("images/bannerDown2.jpg");
			changeBoy();
		break;
		case 2:
			banner_down = loadImage("images/bannerDown3.jpg");			
		break;
	}
}



void getExEy(int controlPoint) {
	switch(controlPoint) {
		case 1:
			ex = chairX + 113;
			ey = chairY + 230;
		break;
		case 2:
			ex = chairX + 114;
			ey = chairY + 175 + chairHeight;
		break;
		case 3:
			ex = chairX + 51;
			ey = chairY + 178 + chairHeight;
		break;
		case 4:
			ex = chairX+51 + 205 * sin(radians(-chairBackAngle+163));
			ey = chairY+178 + chairHeight + 205 * cos(radians(-chairBackAngle+163));
		break;
		case 5:
			ex = chairX+51 + 154 * sin(radians(-chairBackAngle+163));
			ey = chairY+178 + chairHeight + 154 * cos(radians(-chairBackAngle+163));
		break;
		case 6:
			ex = chairX+51 + 60 * sin(radians(-chairBackAngle+126));
			ey = chairY+178 + chairHeight + 60 * cos(radians(-chairBackAngle+126));
		break;
		case 7:
			ex = keyboardX + 20;
			ey = keyboardY - 3;
		break;
	}
}


void drawControlPoint() {
  ellipse(ex,ey,30,30);
  ellipse(ex,ey,4,4);
}


void checkControlPoints(boolean act) {	

	if(controlPointsAppearance) {
		image(controlPointsDisappear, 620, 360);
		drawAllControlPoints();
	}
	else
		image(controlPointsAppear, 620, 360);

	if(mouseX > 620 && mouseX < 740 && mouseY > 360 && mouseY < 410) {
		if(controlPointsAppearance)
			image(controlPointsDisappearOver, 620, 360);
		else
			image(controlPointsAppearOver, 620, 360);

		if(act) {
			if(controlPointsAppearance == true) 
				controlPointsAppearance = false;
			else
				controlPointsAppearance = true;
		}
	}

	



	if(mouseX > 620 && mouseX < 680 && mouseY > 425 && mouseY < 485) {
		if(act) changeStatus(1);
		image(play_over,620,425);		
	}
	else {
		image(play,620,425);
	}

	if(mouseX > 690 && mouseX < 750 && mouseY > 425 && mouseY < 485) {
		if(act) changeStatus(0);
		image(restore_over,690,425);		
	}
	else {
		image(restore,690,425);
	}	

	getExEy(4);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 4;
         drawControlPoint();
		return;
	}

	getExEy(5);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 5;		
		drawControlPoint();
		return;
	}

	getExEy(6);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 6;		
		drawControlPoint();
		return;
	}

	getExEy(1);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 1;
		drawControlPoint();
		return;
	}

	getExEy(2);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 2;
		drawControlPoint();
		return;
	}

	getExEy(3);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 3;
		drawControlPoint();
		return;
	}
	
	getExEy(7);
	if( pow(mouseX-ex,2) + pow(mouseY-ey,2) < pow(15,2)) {
		if(act) action = 7;
		drawControlPoint();
		return;
	}	
}


void drawAllControlPoints() {

	for(int i=1;i<8;i++) {
		getExEy(i);
		fill(255,0,0,128);
		switch(i) {
                    case 1:
                      if(chairX > sceneX-185 && chairX <= sceneX - 176) fill(0,255,0,128);
                    break;                   
                    case 2:
                      if(chairHeight > -2 && chairHeight <= 1) fill(0,255,0,128);
                    break;                  
                    case 3:
                      if(chairBackAngle > -2 && chairBackAngle <=2) fill(0,255,0,128);
                    break;
                    case 4:
                      if(headAngle > -5 && headAngle <= 0) fill(0,255,0,128);
                    break;                    
                    case 5:
                      if(armAngle > 0 && armAngle <= 4) fill(0,255,0,128);
                    break;
                    case 6:
                      if(legAngle > -3 && legAngle <= 2) fill(0,255,0,128);
                    break;
                    case 7:
                      if(keyboardAngle > -2 && keyboardAngle <= 1 && keyboardX > 398 && keyboardX <= 403) fill(0,255,0,128);
                    break;               
        }
		drawControlPoint();
	}

}


void showTip(int tip) {
	switch (tip) {
		case 1:
			image(tip1,490,15);
		break;
		case 2:
			image(tip2,490,15);
		break;
		case 3:
			image(tip3,490,15);
		break;
		case 4:
			image(tip4,490,15);
		break;
		case 5:
			image(tip5,490,15);
		break;
		case 6:
			image(tip6,490,15);
		break;
		case 7:
			image(tip7,490,15);
		break;
	}
        strokeWeight(1);
	line(ex,ey,490,119);
        strokeWeight(4);
}


void draw() {
	
	background(255);		
	fill(0);
	rect(0,490,800,550);
		
	drawChair(chairX, chairY);
	drawKeyboard();
	drawBoy(chairX, chairY);		

	if(chairX + 51 + 225 * sin(radians(-chairBackAngle+78)) > sceneX+60) {
		image(imgDesk2, sceneX, sceneY);
		tint(255,164); 
		image(imgDeskTrans, sceneX+44, sceneY+247);
		noTint();                
	}
	else {
		image(imgDesk, sceneX, sceneY);
	}
				
	
	if(action != 0 && status == 1) {
				getExEy(action);
                fill(255,0,0,128);

				

                switch(action) {
                    case 1:
                      if(chairX > sceneX-185 && chairX < sceneX - 176) {
							fill(0,255,0,128);
							AllCorrect[0] = 1;
					  }
					  else {
						AllCorrect[0] = 0;
					  }
                    break;                   
                    case 2:
                      if(chairHeight > -2 && chairHeight < 1) {
							fill(0,255,0,128);
							AllCorrect[1] = 1;
						}
					  else {
						AllCorrect[1] = 0;
					  }
                    break;                  
                    case 3:
                      if(chairBackAngle > -2 && chairBackAngle <2) {
							fill(0,255,0,128);
							AllCorrect[2] = 1;
					  }
					  else {
						AllCorrect[2] = 0;
					  }
                    break;
                    case 4:
                      if(headAngle > -5 && headAngle < 0) {
							fill(0,255,0,128);
							AllCorrect[3] = 1;
					  }
					  else {
						AllCorrect[3] = 0;
					  }
                    break;                    
                    case 5:
                      if(armAngle > 0 && armAngle < 4) {
							fill(0,255,0,128);
							AllCorrect[4] = 1;
					  }
					  else {
						AllCorrect[4] = 0;
					  }
                    break;
                    case 6:
                      if(legAngle > -3 && legAngle < 2) {
							fill(0,255,0,128);
							AllCorrect[5] = 1;
					  }
					  else {
						AllCorrect[5] = 0;
					  }
                    break;
                    case 7:
                      if(keyboardAngle > -2 && keyboardAngle <= 1 && keyboardX > 398 && keyboardX < 403) {
							fill(0,255,0,128);
							AllCorrect[6] = 1;
					  }
					  else {
						AllCorrect[6] = 0;
					  }
                    break;               
                }
		drawControlPoint();
		showTip(action);

		temp = 0;
		for(int i=0;i<7;i++)
			temp += AllCorrect[i];

		if(temp == 7 && status==1) {
			changeStatus(2);
		}

	}
	else {
        fill(255,255,0,164);
		checkControlPoints(false);
	}
	
	


	//if(!drag && status>0)			
		image(banner_down,0,500);
	
	if(drag && status == 1) {
		image(banner_down_help,0,500);
		image(controlPointsAppear, 620, 360);
		image(play,620,425);
		image(restore,690,425);
	}


}



void mousePressed() {
	checkControlPoints(true);
	if(status ==1) drag = true;
}


void mouseDragged() {	

if(status == 1) {

	switch(action) {
		case 1:
			chairX -= pmouseX - mouseX;
			if(chairX < 20) chairX = 20;
			if(chairX > 220) chairX = 220;
			cursor(MOVE);
		break;		
		case 2:
			chairHeight -= pmouseY - mouseY;
			if(chairHeight < 0) chairHeight = 0;
			if(chairHeight > 21) chairHeight = 21;
			cursor(MOVE);
		break;
		case 3:
			chairBackAngle -= pmouseX - mouseX;
			if(chairBackAngle < -40) chairBackAngle = -40;
			if(chairBackAngle > 2) chairBackAngle = 2;
			cursor(MOVE);
		break;
		case 4:
			headAngle -= pmouseY - mouseY;
			if(headAngle < -40) headAngle = -40;
			if(headAngle > 40) headAngle = 40;
			cursor(MOVE);
		break;
		case 5:
			armAngle -= pmouseY - mouseY;
			if(armAngle < -40) armAngle = -40;
			if(armAngle > 40) armAngle = 40;
			cursor(MOVE);
		break;
		case 6:
			legAngle -= pmouseY - mouseY;
			if(legAngle < -31) legAngle = -31;
			if(legAngle > 20) legAngle = 20;
			cursor(MOVE);
		break;
		case 7:
			keyboardX -= pmouseX - mouseX;
			if(keyboardX < 360) keyboardX = 360;
			if(keyboardX > 430) keyboardX = 430;
			keyboardAngle -= pmouseY - mouseY;
			if(keyboardAngle < -40) keyboardAngle = -40;
			if(keyboardAngle > 40) keyboardAngle = 40;			
			cursor(MOVE);
		break;	
	}
}

}

void mouseReleased() {  
	drag = false;
	action = 0;
	cursor(ARROW);
}
