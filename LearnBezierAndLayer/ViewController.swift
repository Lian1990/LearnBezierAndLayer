//
//  ViewController.swift
//  LearnBezierAndLayer
//
//  Created by LIAN on 16/3/3.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.learnBasisFeature()
//        self.bezierDrawRoundCorner()
//        self.bezierDrawCircle()
//        self.bezierDrawCurves()
        self.bezierDrawHeart()
    }
    
    /**
     * 基本属性
     */
    func learnBasisFeature (){
        let layer = CAShapeLayer()
        layer.frame = CGRectMake(100, 100, 150, 150)
        layer.backgroundColor = UIColor.blackColor().CGColor
        view.layer.addSublayer(layer)
        
        let path = UIBezierPath(rect: CGRectMake(50, 280, 200, 150))
        let layer2 = CAShapeLayer()
        layer2.path = path.CGPath
        layer2.fillColor = UIColor.blueColor().CGColor //填充色
        layer2.strokeColor = UIColor.redColor().CGColor //边框色
        view.layer.addSublayer(layer2)
    }
    
    /**
     * 圆角矩形
     */
    func bezierDrawRoundCorner (){
        let path = UIBezierPath(roundedRect: CGRectMake(60, 180, 200, 160),cornerRadius:30)
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.fillColor = UIColor.grayColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        view.layer.addSublayer(layer)
    }
    
    /**
     * 圆
     */
    func bezierDrawCircle()
    {
        let radius :CGFloat = 70.0
        let startAngle :CGFloat = 0.0
        let endAngle :CGFloat = CGFloat(M_PI * 2)
        let path = UIBezierPath(arcCenter: CGPointMake(180, 200), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        view.layer.addSublayer(layer)
    }
    
    /**
     * 曲线
     */
    
    private func bezierDrawCurves (){
        
        let startPoint = CGPointMake(80, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(150, 200)
        let controlPoint2 = CGPointMake(220, 400)
        
        let  layer1 = CALayer()
        layer1.frame = CGRectMake(startPoint.x, startPoint.y, 10, 10)
        layer1.backgroundColor = UIColor.redColor().CGColor
        
        let  layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x, endPoint.y, 10, 10)
        layer2.backgroundColor = UIColor.redColor().CGColor
        
        let  layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 10, 10)
        layer3.backgroundColor = UIColor.redColor().CGColor
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        //        path.addQuadCurveToPoint(endPoint, controlPoint: controlPoint) //一个弧度
        path.addCurveToPoint(endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint2)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        
        view.layer.addSublayer(layer)
        view.layer.addSublayer(layer1)
        view.layer.addSublayer(layer2)
        view.layer.addSublayer(layer3)
    }
    
    /**
     * 桃心
     */
    
    func bezierDrawHeart(){
        let radius :CGFloat = 40
        let center1 :CGPoint = CGPointMake(240, 300)
        let center2 :CGPoint = CGPointMake(160, 300)
        let angle1 :CGFloat = CGFloat(M_PI)
        let angle2 :CGFloat = CGFloat(M_PI_4)
        let path = UIBezierPath(arcCenter: center1, radius: radius, startAngle: -angle1, endAngle: angle2, clockwise: true) //右半边
        path.addLineToPoint(CGPointMake(center1.x - radius, center1.y + radius * tan((angle1-angle2)*0.5)))
        path.addArcWithCenter(center2, radius: radius, startAngle: 3*angle2, endAngle: 0, clockwise: true)  //左半边
        
        let layer = CAShapeLayer()
        layer.path = path.CGPath
        layer.fillColor = UIColor.redColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        layer.lineWidth = 3
        layer.lineCap = kCALineCapRound
        view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

