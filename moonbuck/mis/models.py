from django.db import models
import MySQLdb as mysqldb

# Create your models here.

class customer(models.Model):
    cuId=models.IntegerField(max_length=10,null=False)
    cuName=models.CharField(max_length=10,null=True)
    cuEmail=models.EmailField()
    cuPhone=models.CharField(max_length=13,null=False) 
    cuScore=models.IntegerField(max_length=16,null=False)
    cuCreate=models.TimeField()
    cuYear=models.IntegerField(max_length=3,null=True)
    cuBirth=models.TimeField()
    cuZone-models.CharField(max_length=12,null=True)
    cuType=models.CharField(max_length=10,null=True)
    
    def __unicode__(self):
        return self.cuId, self.cuName

class piece(models.Model):
    piId=models.IntegerField(max_length=10,null=False)
    piProfit=models.FloatField(null=True)
    piTime=models.TimeField()
    piPerfer=models.CharField(null=True)
    piOff=models.IntegerField(max_length=20,null=True)

    def __unicode__(self):
        return self.piId, self.piProfit


class order(models.Model):
    orId=models.IntegerField(max_length=20,null=False)
    orCu=models.ForeignKey(customer,cuID)
    orTime=models.TimeField()
    orPay=models.CharField(max_length=10,null=False)
    orOff=models.IntegerField(max_length=20,null=True)

    def __unicode__(self):
        return self.orId, self.orCu

class orderPiece(models.Model):
    opId=models.ForeignKey(order,orId)
    opPiece=models.ForeignKey(piece,piId)
    opNum=models.IntegerField(max_length=5,null=False)
    opOff=models.IntegerField(max_length=5,null=True)
    opPrefer=models.ForeignKey(piece,piPrefer)

    def __unicode__(self):
        return self.opId,self.opPiece

class project(models.Model):
    poId=models.IntegerField(max_length=10,null=False)
    # 顾客类型的处理这里不好做啊
    poCu=models.IntegerField(max_length=10,null=True)
    poBegin=models.TimeField()
    poEnd=models.TimeField()
    poType=models.IntegerField(max_length=10,null=True)
