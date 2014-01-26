from django.core.exceptions import ObjectDoesNotExist

__author__ = 'herald olivares'
from django.views.generic.list import ListView
from upc.sunat.models import Debt, Person
from upc.sunat.forms import SearchDebtForm

class DebtListView(ListView):
    model = Debt
    paginate_by = 5
    template_name = "sunat.html"

    def get_queryset(self):
        qs = super(DebtListView, self).get_queryset()
        ruc = self.request.GET.get('ruc')
        if ruc:
            qs = qs.filter(person__ruc = ruc)
            return qs
        return list()

    def get_context_data(self, **kwargs):
        ctx = super(DebtListView, self).get_context_data(**kwargs)
        ruc = self.request.GET.get('ruc')
        form = SearchDebtForm(self.request.GET)
        ctx['form'] = form
        if ruc:
            try:
                ctx['person'] = Person.objects.get(ruc=ruc)
            except ObjectDoesNotExist:
                pass
        return ctx