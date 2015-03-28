# -*- coding: utf8 -*-

from __future__ import division
from random import random

class Kuh:

    def __init__(self, alter=5):
        # hunger ist eine Zahl zwischen 0 und 99
        # bei 0 ist die Kuh ganz satt
        # bei 99 ist die Kuh verhungert
        # beim Füttern wird von der Zahl etwas abgezogen (aber es kann kein Wert unter
        # 0 angenommen werden)
        self.hunger = 30

        # alter ist eine Zahl >=0
        # je älter die Kuh wird, desto höher ist die Wahrscheinlichkeit, dass sie krank wird
        # Lebenserwartung: ca. 20 Jahre
        # wenn die Kuh mindestens 3 Jahre alt ist, gibt sie Milch
        self.alter = alter


    def wird_gemolken(self):
        """Gibt zurück, wie viel Milch die Kuh in diesem Jahr gibt (in 100l)."""
        return 29

    def wird_gefuettert(self):
        self.hunger -= 10
        if self.hunger < 0:
            self.hunger = 0

    def ist_krank(self):
        return random() < 0.1

    def ist_gestorben(self):
        return self.hunger >= 99 or (random() < self.alter * 1/25 - 0.1)

    def bekommt_kaelbchen(self):
        return self.alter >= 3 and random() < 0.2

    def tick(self):
        self.hunger += 8
        self.alter += 1


geld = 200
kuehe = [Kuh(), Kuh(), Kuh()]


def kuh_kaufen():
    global geld, kuehe
    kuehe.append(Kuh())
    geld -= 50


def kuh_verkaufen():
    global geld, kuehe
    kuehe = kuehe[1:]
    geld += 50


def fuettern():
    global geld, kuehe
    for kuh in kuehe:
        kuh.wird_gefuettert()
        geld -= 1


def tick():
    global geld, kuehe
    print 'Du hast %d Münzen' % geld
    print 'Du hast %d Kühe.' % len(kuehe)
    print 'Alter:', [kuh.alter for kuh in kuehe]
    print 'Hunger:', [kuh.hunger for kuh in kuehe]
    print
    for kuh in kuehe:
        kuh.tick()
        if kuh.ist_gestorben():
            print "Die Kuh ist gestorben."
            kuh.alter = -1
        if kuh.ist_krank():
            geld -= 30
            print "Die Kuh ist krank. Der Tierarzt kommt. Das kostet 30 Münzen."
        if kuh.bekommt_kaelbchen():
            kuehe.append(Kuh(0))
            print "Die Kuh bekommt ein Kälbchen."
    kuehe = [kuh for kuh in kuehe if kuh.alter >= 0]
    print


if __name__ == '__main__':
    tick()
    while 1:
        if geld < 0:
            print "Du bist pleite!"
            break
        aktion = raw_input('Was möchtest Du tun? ')
        if aktion == 'kaufen':
            kuh_kaufen()
        elif aktion == 'verkaufen':
            kuh_verkaufen()
        elif aktion == 'fuettern':
            fuettern()
        else:
            tick()



# melken, menge der milch anzeigen, milch verkaufen

