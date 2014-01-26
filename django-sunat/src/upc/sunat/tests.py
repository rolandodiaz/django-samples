__author__ = 'herald olivares'

from django.test import TestCase
from upc.sunat.models import Person, Concept, Debt

class ConceptTestCase(TestCase):
    def setUp(self):
        Concept.objects.create(name="concept1")
        Concept.objects.create(name="concept2")

    def test_concept_crud(self):
        """Animals that can speak are correctly identified"""
        concept1 = Concept.objects.get(name="concept1")
        concept2 = Concept.objects.get(name="concept2")
        self.assertEqual(concept1.name, 'concept1')
        self.assertEqual(concept2.name, 'concept2')
        self.assertEqual(Concept.objects.count(), 2)


class PersonTestCase(TestCase):
    def setUp(self):
        Person.objects.create(name='Juan', type=1, ruc="12345678987", phone="5678998")
        Person.objects.create(name='PCM', type=1, ruc="23456789021", phone="342434")

    def test_person_crud(self):
        self.assertEqual(Person.objects.count(), 2)
        person1 = Person.objects.get(pk=1)
        person2 = Person.objects.get(pk=2)
        self.assertEqual(person1.ruc, '12345678987')
        self.assertEqual(person2.ruc, '23456789021')


class DebtTestCase(TestCase):
    def setUp(self):
        concept1 = Concept.objects.create(name="concept1")
        concept2 = Concept.objects.create(name="concept2")
        person1 = Person.objects.create(name='Juan', type=1, ruc="12345678987", phone="5678998")
        person2 = Person.objects.create(name='PCM', type=1, ruc="23456789021", phone="342434")

        Debt.objects.create(concept=concept1, person=person1,
                            period='January - September', tax_code='09876', amount=120)
        Debt.objects.create(concept=concept1, person=person1,
                            period='January - September', tax_code='32276', amount=2000)
        Debt.objects.create(concept=concept2, person=person1, period='January - September',
                            tax_code='00276', resolution_number='R9849323', amount=1200)
        Debt.objects.create(concept=concept2, person=person2, period='May',
                            tax_code='23376', resolution_number='R9849323', amount=4000)

    def test_debt_crud(self):
        #comprobamos que la cantidad de deudas sea cuatro
        self.assertEqual(Debt.objects.count(), 4)
        #buscamos las deudas por persona
        #comprobaremos que la persona1 tiene 3 deudas
        #primero usamos la convencion utilizando directamente el atributo ruc de la entidad persona
        person1_debts = Debt.objects.filter(person__ruc='12345678987')
        self.assertEqual(person1_debts.count(), 3)
        self.assertEqual(person1_debts[2].amount, 1200)
        #ahora usamos una instancia de la entidad persona para el filtro por ruc y obtenemos el mismo resultado
        person1 = Person.objects.get(pk=1)
        person1_debts = Debt.objects.filter(person=person1)
        self.assertEqual(person1_debts.count(), 3)
        self.assertEqual(person1_debts[0].amount, 120)