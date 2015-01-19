# -*- coding:utf8 -*-

# Create your views here.
from django.http import HttpResponse,Http404
from django.template import Template, Context, RequestContext
from django.template.loader import get_template
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
import datetime

from django.db.models import *
from moonbuck.mis.models import *

def homepage(request):
    return render_to_response('index.html',locals())

def crmHome(request):
    return render_to_response('CRM首页.html',locals())

def prmHome(request):
    return render_to_response('PRM首页.html',locals())

@csrf_exempt
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
        if 'participant1' & 'textcontent1' in request.GET:
            participant1 = request.GET['participant1'][0]
            textcontent1 = request.GET['textcontent1'][0]
            print(participant1)
            if participant1 == 2:
                record = customer.objects.filter(cuName=textcontent1)
            return render_to_response('CRM查询结果.html',locals())
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
            t1 = query['textcontent1'][0]
            if p1 == '2':
                record = customer.objects.filter(cuName=t1)
            elif p1 == '3':
                record = customer.objects.filter(cuEmail=t1)
            elif p1 == '4':
                record = customer.objects.filter(cuScore=int(t1))
            elif p1 == '5':
                record = customer.objects.filter()
                pass
            elif p1 == '6':
                record = customer.objects.filter(cuType=t1)
            elif p1 == '7':
                record = customer.objects.filter(cuId=int(t1))
            # 这里还没处理return的页面
            return HttpResponse("something to response")

def favor(request):
    return render_to_response('credit.html',locals())

#√
def crmproject(request):
    record = project.objects.all()
    return render_to_response('CRM优惠项目进程.html',locals())

def crmaddproject(request):
    return render_to_response('add_benefit_item.html',locals())
def crmprojectdetail(request):
    #需要按照优惠的类型返回不同的页面，这里只是为了先把函数定义了
    if request.method == "POST":
        q=request.POST
        items=q['items'][0]
        print(items)
        if items == 1:
            return HttpResponseRedirect('/crm/project/add')
        if items == 2:
            return render_to_response('youhuizhengce_maijiusong.html',locals())
        if items == 3:
            return render_to_response('youhuizhengce_manjiusong.html',locals())
        if items == 4:
            return render_to_response('youhuizhengce_tejiashangpin.html',locals())
        if items == 5:
            return render_to_response('youhuizhengce_manjiujian.html',locals())
        if items == 6:
            return render_to_response('youhuizhengce_jifenduihuan.html',locals())
        if items == 7:
            return render_to_response('youhuizhengce_xinpinchangxianjia.html',locals())

    return render_to_response('add_benefit_item.html',locals())

def prmproject(request):
    return render_to_response('已有公关媒体信息.html',locals())
def prmprojectdetail(request):
    return render_to_response('PRM项目进程.html',locals())
def additem(request):
    return render_to_response('add_public_item.html',locals())
def addmedia(request):
    return render_to_response('add_public_relation.html',locals())