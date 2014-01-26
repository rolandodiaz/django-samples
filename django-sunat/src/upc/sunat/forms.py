__author__ = 'herald olivares'
from django import forms
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext as _

def validate_ruc(value):
    if len(value) != 11:
        raise ValidationError(_('Ruc must be 11 characters'))

class SearchDebtForm(forms.Form):
    ruc = forms.CharField(max_length=11, required=True, validators=[validate_ruc],
                          widget=forms.TextInput(
                              attrs={'placeholder' : _('Typed ruc number'),
                                     'required': 'required'}
    ))