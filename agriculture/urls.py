from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static

from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^insert$', views.insert),
    url(r'^login/$', views.login1),
    url(r'^loginAuth/$', views.loginAuth, name='loginAuth'),
    url(r'^insertSuccess$', views.insertSuccess, name='insertSuccess'),
    url(r'^insertCall$', views.insertCall, name='insertCall'),
    url(r'^updateAddress$', views.updateAddress, name='updateAddress'),
    url(r'^updateaddressfinal/$', views.updateAddressFinal, name='updateAddressFinal'),
    url(r'^supervises$', views.supervises, name='supervises'),
    url(r'^supervisesfin/$', views.supervisesFin, name='supervisesFin'),
    url(r'^logout/$', views.logout_view, name='logout_view'),
    url(r'^print/$', views.printData, name='printData'),

] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
