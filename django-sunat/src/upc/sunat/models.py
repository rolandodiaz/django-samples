__author__ = 'herald olivares'
# -*- coding: utf-8 -*-
#TODO
#EN ESTE ARCHIVO SE ESPECIFICA LO QUE VENDRIA A SER LA CAPA DE PERSISTENCIA
#UNA ENTIDAD O MODELO DEBE SER UNA SUBCLASE DE Model
#AUTOMATICAMENTE SE SINCRONIZARAN A LA BD AL EJECUTAR EL COMANDO syncdb
from django.db import models
from django.utils.translation import ugettext as _

PERSON_TYPE = (
    (1, _('Legal Person')),
    (2, _('Juridic Person')),
)


class Person(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name=_("Name"), max_length=200, db_index=True)
    ruc = models.CharField(verbose_name=_("RUC"), max_length=11)
    phone = models.CharField(verbose_name=_("Phone"), max_length=11,
                             null=True, blank=True)
    type = models.IntegerField(verbose_name=_("Person Type"), choices=PERSON_TYPE)

    class Meta:
        verbose_name = _("Person")
        verbose_name_plural = _("Persons")

    def __unicode__(self):
        return self.ruc


class Concept(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name=_("Name"), max_length=150, db_index=True)

    class Meta:
        verbose_name = _("Concept")
        verbose_name_plural = _("Concepts")

    def __unicode__(self):
        return self.name


class Debt(models.Model):
    id = models.AutoField(primary_key=True)
    concept = models.ForeignKey(Concept, verbose_name=_("Concept"))
    person = models.ForeignKey(Person, verbose_name=_("Person"))
    period = models.CharField(verbose_name=_("Period"), max_length=30)
    resolution_number = models.CharField(verbose_name=_("Resolution Number"), max_length=20,
                                         null=True, blank=True)
    tax_code = models.CharField(verbose_name=_("Tax Code"), max_length=10,
                                null=True, blank=True)
    amount = models.DecimalField(verbose_name=_("Amount"), max_digits=14, decimal_places=2)

    class Meta:
        verbose_name = _("Debt")
        verbose_name_plural = _("Debts")

    def __unicode__(self):
        return 'Multa por %s pertenciente a %s en %s equivalente %s' % (
            self.concept, self.person, self.period, self.amount)
