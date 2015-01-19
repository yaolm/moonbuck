# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template, Context, RequestContext
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
    errors = []
    if request.method == 'POST':
        if not errors:
            userno = request.GET['userno']
            username = request.GET['username']
            email = request.GET['email']
            mob_num = request.GET['mob_num']
            birthyear = request.GET['birthyear']
            birthmonth = request.GET['birthmonth']
            birthday = request.GET['birthday']
            address = request.GET['address']
            cryear = request.GET['cryear']
            crmonth = request.GET['crmonth']
            crday = request.GET['crday']

            temp = customer(cuId=userno,cuName=username,cuEmail=email,cuPhone=mob_num,cuCreate=crday)
            temp.save()

            return HttpResponseRedirect('/crm/')
    
    return render_to_response('add_customer.html',locals())


def crm_user_search(request):
    return render_to_response('CRM检索页面.html',locals())

def crm_user_searchresult(request):
    if request.method == 'GET':
        query = request.GET
        print(query)
        if query['participant1'][0] == '1':
            return HttpResponse("nothing to response")
            #return render_to_response('CRM查询结果.html',locals())
        else:
            return HttpResponse("something to response")
            #return render_to_response('CRM检索页面.html',locals())
    elif request.method == 'POST':
        query = request.POST
        print(query)
        if query.get('participant1')[0] == '1':
            return HttpResponse("nothing to response")
        else:
            p1 = query['participant1'][0]
            if p1 == '2':
                pass

def favor(request):
    return render_to_response('credit.html',locals())

def crmproject(request):
    return render_to_response('CRM优惠项目进程.html',locals())

def crmaddproject(request):
    return render_to_response('add_benefit_item.html',locals())
def crmprojectdetail(request):
    #需要按照优惠的类型返回不同的页面，这里只是为了先把函数定义了
    return render_to_response('youhuizhengce_jifenduihuan.html',locals())


def prmproject(request):
    return render_to_response('PRM项目进程.html',locals())
def additem(request):
    return render_to_response('add_public_item.html',locals())
def addmedia(request):
    return render_to_response('add_public_relation.html',locals())