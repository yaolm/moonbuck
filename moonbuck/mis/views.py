# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template,Context
from django.template.loader import get_template
from django.shortcuts import render_to_response
import datetime

from django.db.models import *

def homepage(request):
<<<<<<< HEAD
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())
=======
    pagetitle = "Home"
    content = ""
    return render_to_response('index.html',locals())
>>>>>>> 45ec33a541ed8455d0361b7bb975baefe2f47d6b
