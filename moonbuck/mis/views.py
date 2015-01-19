# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template,Context
from django.template.loader import get_template
from django.shortcuts import render_to_response
import datetime

from django.db.models import *

def homepage(request):
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())

def crmSearch(request):
    return render_to_response('CRM检索页面.html',locals())

def crmSearchResult(request):
    if request.method == 'GET':
        query = request.GET
        pass
    elif request.method =='POST':
        query = request.POST
        pass
    else:
        return render_to_response('CRM查询结果.html',locals())

def prmHome(request):
    return render_to_response('PRM首页.html',locals())

