# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication, QFontDatabase
from PySide2.QtQml import QQmlApplicationEngine

CURRENT_DIRECTORY = os.path.dirname(os.path.realpath(__file__))

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    font_comfortaa = os.path.join(CURRENT_DIRECTORY, "font", "Comfortaa/Comfortaa-Regular.ttf")
    _id2 = QFontDatabase.addApplicationFont(font_comfortaa)

    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
