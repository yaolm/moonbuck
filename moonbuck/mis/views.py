# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template,Context
from django.template.loader import get_template
from django.shortcuts import render_to_response
import datetime

from django.db.models import *
from moonbuck.mis.models import *

def homepage(request):
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())

def prmHome(request):
    return render_to_response('PRM首页.html',locals())

def crm_adduser(request):


def crm_user_search(request):
    #return render_to_response('CRM检索页面.html',locals())
    if 'participant1' & 'textcontent1' in request.GET:
        participant1=request.GET['participant1']
        textcontent1=request.GET['textcontent1']
        if participant1 == 2:
            record=mis.objects.filter(cuName=textcontent1)
            return render_to_response('CRM查询结果.html',locals())
        else:
            return render_to_response('CRM检索页面.html',locals())
    else:
        return render_to_response('CRM检索页面.html',locals())

def crm_user_searchresult(request):
    if 'participant1' & 'textcontent1' in request.GET:
        participant1=request.GET['participant1']
        textcontent1=request.GET['textcontent1']
        if participant1 == 2:
            record=mis.objects.filter(cuName=textcontent1)
        return render_to_response('CRM查询结果.html',locals())
    else:
        return render_to_response('CRM检索页面.html',locals())
