__author__ = 'herald olivares'
# -*- coding: utf-8 -*-

from django.contrib import admin
from upc.sunat.models import Person, Concept, Debt

class PersonAdmin(admin.ModelAdmin):
    list_display = ('name', 'ruc', 'phone', 'type')

class ConceptAdmin(admin.ModelAdmin):
    pass

class DebtAdmin(admin.ModelAdmin):
    list_display = ('concept', 'person', 'period', 'tax_code', 'resolution_number', 'amount')

admin.site.register(Person, PersonAdmin)
admin.site.register(Concept, ConceptAdmin)
admin.site.register(Debt, DebtAdmin)


