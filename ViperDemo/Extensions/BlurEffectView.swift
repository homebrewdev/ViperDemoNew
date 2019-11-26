//
//  BlurEffectView.swift
//  stackOFlowApp
//
//  Created by riff on 07/10/2019.
//  Copyright © 2019 Egor Devyatov. All rights reserved.
//

import UIKit

let applyBlurEffectView: UIVisualEffectView = {
    //Обычное представление для блюра
    let blurEffect = UIBlurEffect(style:  .light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)

    //Мешаем правилам авто-изменения размеров превращаться в ограничения
    blurEffectView.translatesAutoresizingMaskIntoConstraints = false

    //Создаём эффект размытия и добавляем в блюр
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
    blurEffectView.contentView.addSubview(vibrancyView)
    return blurEffectView
}()
