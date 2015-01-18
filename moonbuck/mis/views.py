# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template,Context
from django.template.loader import get_template
from django.shortcuts import render_to_response
import datetime

from mis.models import *

def homepage(request):
    pagetitle="Home"
    content=""
    return render_to_response('base.html',locals())