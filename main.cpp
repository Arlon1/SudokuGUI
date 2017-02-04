/*
 * main.cpp
 *
 *  Created on: Aug 3, 2012
 *      Author: Daniel Pelikan
 */

#include "MainWindow.h"

#include <QApplication>

int main(int argc, char **argv) {
	QApplication app(argc,argv);
	MainWindow *mainWindow = new MainWindow;
	mainWindow->show();


	return app.exec();
}
