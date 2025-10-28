import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtjogadores: UITextField!
    
    @IBOutlet weak var lbdados: UILabel!
    
    
    @IBOutlet weak var lbrondas: UILabel!
    
    
    @IBOutlet weak var imgdado1: UIImageView!
    
    @IBOutlet weak var imgdado2: UIImageView!
    
    @IBOutlet weak var btndados: UIButton!
    
    
    @IBOutlet weak var btnrondas: UIButton!	
    
    
    @IBOutlet weak var btncomeca: UIButton!

    var dados: Int = 1
        var rondas: Int = 1
        var jogadores: Int = 1
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func bdados1(_ sender: Any) {
        
        let n = Int.random(in: 1...6)
        lbdados.text = "\(n)"
        imgdado1.image = UIImage(named: "dado\(n)")
    }
    
    @IBAction func bdado2(_ sender: Any) {
        let n = Int.random(in: 1...6)
        lbrondas.text = "\(n)"
        imgdado2.image = UIImage(named: "dado\(n)")
    }
    @IBAction func bcomeca(_ sender: Any) {
        if let dadosInt = Int(lbdados.text!), let rondasInt = Int(lbrondas.text!), let jogadoresInt = Int(txtjogadores.text!) {
                    dados = dadosInt
                    rondas = rondasInt
                    jogadores = jogadoresInt
                } else {
                    dados = 1
                    rondas = 1
                    jogadores = 1
                }
        UserDefaults.standard.set(dados, forKey: "ndados")
        UserDefaults.standard.set(rondas, forKey: "nrondas")
        UserDefaults.standard.set(jogadores, forKey: "njogadores")
    }
    
}
    

