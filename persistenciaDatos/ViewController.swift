//
//  ViewController.swift
//  persistenciaDatos
//
//  Created by Jonh Parra on 31/10/19.
//  Copyright © 2019 Jonh Parra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textoInput: UITextField!
    @IBOutlet weak var barra: UINavigationBar!
    @IBOutlet weak var botonNav: UINavigationBar!
    @IBOutlet var botones: [UIButton]!
    @IBOutlet weak var textoNocturno: UILabel!
    @IBOutlet weak var btnSwitch: UISwitch!
    
    let iron = UIColor.init(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
    let magnecium = UIColor.init(red: 195/250, green: 195/255, blue: 195/255, alpha: 1)
    let dark = UIColor.black
    let white = UIColor.white
    let turquesa = UIColor.init(red: 94/255, green: 203/255, blue: 250/250, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guardandoArrays()
        noctMod()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveData(_ sender: UIBarButtonItem) {
        UserDefaults.standard.set(textoInput.text, forKey: "texto")
        print("guardado")
        print(textoInput.text ?? "default value")
        textoInput.text = " "
    }
    
    @IBAction func mostrarData(_ sender: UIButton) {
        textoInput.text = UserDefaults.standard.object(forKey: "texto") as? String
    }
    
    @IBAction func eliminarData(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "texto")
    }
    
    func guardandoArrays () {
        let animales = ["caballo", "perro", "gato", "vaca", "pollito"]
        UserDefaults.standard.set(animales, forKey: "arrayAnimales")
        print("guardo el array de animales")
        
        let myArray = UserDefaults.standard.array(forKey: "arrayAnimales")
        print(myArray ?? "el arreglo no aparecio")
        print(myArray?[0] ?? "no hay array")
    }
    
    
    @IBAction func changeMod(_ sender: UISwitch) {
        if btnSwitch.isOn{
            self.view.backgroundColor = dark
            botones[0].backgroundColor = magnecium
            botones[1].backgroundColor = magnecium
            botones[0].setTitleColor(dark, for: .normal)
            botones[1].setTitleColor(dark, for: .normal)
            barra.barTintColor = magnecium
            botonNav.tintColor = dark
            textoNocturno.textColor = white
            btnSwitch.thumbTintColor = magnecium
            UserDefaults.standard.set(btnSwitch.isOn, forKey: "status")
        } else {
            self.view.backgroundColor = white
            botones[0].backgroundColor = turquesa
            botones[1].backgroundColor = turquesa
            botones[0].setTitleColor(dark, for: .normal)
            botones[1].setTitleColor(dark, for: .normal)
            barra.barTintColor = turquesa
            botonNav.tintColor = dark
            textoNocturno.textColor = dark
            btnSwitch.thumbTintColor = turquesa
            UserDefaults.standard.removeObject(forKey: "status")
        }
    }
    
    func noctMod () {
        if (UserDefaults.standard.object(forKey: "status") != nil) {
           self.view.backgroundColor = dark
           botones[0].backgroundColor = magnecium
           botones[1].backgroundColor = magnecium
           botones[0].setTitleColor(dark, for: .normal)
           botones[1].setTitleColor(dark, for: .normal)
           barra.barTintColor = magnecium
           botonNav.tintColor = dark
           textoNocturno.textColor = white
           btnSwitch.thumbTintColor = magnecium
            btnSwitch.isOn = true
        }
    }
    
}

