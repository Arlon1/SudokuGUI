# cleans up compiled/generated files
rm -rf _obj/ SudokuGUI SudokuGUI.pro .qmake.stash

# generates a .pro file
PRO_FILE=`pwd|rev|cut -f1 -d/|rev`.pro
echo $'TEMPLATE = app
TARGET = SudokuGUI
INCLUDEPATH += .
QT += widgets' >> $PRO_FILE

echo "OBJECTS_DIR = _obj/" >> $PRO_FILE
echo "MOC_DIR = _obj" >> $PRO_FILE
echo "UI_DIR = _obj" >> $PRO_FILE

find . -type f -name '*.h'|sed -r 's/.{2}//' > tmp.txt
find . -type f -name '*.hpp'|sed -r 's/.{2}//' >> tmp.txt
echo "HEADERS = " `cat tmp.txt` >> $PRO_FILE

find . -type f -name '*.c'|sed -r 's/.{2}//' > tmp.txt
find . -type f -name '*.cpp'|sed -r 's/.{2}//' >> tmp.txt
echo "SOURCES = " `cat tmp.txt|grep -v Sudoku/Test.cpp|grep -v Sudoku/Main.cpp` >> $PRO_FILE

rm -f tmp.txt
unset PRO_FILE

# generates a Makefile depending on the .pro file
qmake >/dev/null

#make -j4

#./SudokuGUI
