import UIKit

class ViewController2: UIViewController {
    
    var pontos:[Int:Int] = [:]
    
    
    @IBOutlet weak var lbrondas: UILabel!
    
    @IBOutlet weak var lbjogador: UILabel!
    
    @IBOutlet weak var lbpontuacao: UILabel!
    
    @IBOutlet weak var imgdado: UIImageView!
    
    @IBOutlet var btnrolar: UIView!
    
    
    var rondaatual: Int = 1
    var dadoatual: Int = 1
    var jogadoratual : Int = 1
    var dados: Int = 1
    var rondas: Int = 1
    var jogadores: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storedDados = UserDefaults.standard.object(forKey: "ndados") as? Int {
            dados = storedDados
        } else {
            dados = 1
        }
        
        if let storedRondas = UserDefaults.standard.object(forKey: "nrondas") as? Int {
            rondas = storedRondas
        } else {
            rondas = 1
        }
        
        if let storedJogadores = UserDefaults.standard.object(forKey: "njogadores") as? Int {
            jogadores = storedJogadores
        } else {
            jogadores = 1
        }
        
        lbrondas.text = "1"
        lbjogador.text = "1"
        lbpontuacao.text = "0"
        
    }
    
    
    @IBAction func bjogar(_ sender: Any) {
        
        let n = Int.random(in: 1...6)
                
                
        if dadoatual == 1  && rondaatual == 1{
                    pontos[jogadoratual] = n
                } else {
                    pontos[jogadoratual] = (pontos[jogadoratual] ?? 0) + n
                }
                
                imgdado.image = UIImage(named: "dado\(n)")
                lbpontuacao.text = "\(pontos[jogadoratual] ?? 0)"
                
                
                if dadoatual < dados {
                    dadoatual += 1
                } else {
                    
                    if jogadoratual < jogadores {
                        jogadoratual += 1
                        dadoatual = 1
                    } else {
                        if rondaatual < rondas {
                            rondaatual += 1
                            jogadoratual = 1
                            dadoatual = 1
                        }else{
                        
                        let pontosArray = pontos.map { ["id": "\($0.key)", "valor": $0.value] }
                        UserDefaults.standard.set(pontosArray, forKey: "pontos")
                        UserDefaults.standard.set(jogadores, forKey: "jogadores")
                        
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3 {
                            navigationController?.pushViewController(destinationVC, animated: true)
                            }
                        }
                    }
                    lbrondas.text = "\(rondaatual)"
                    lbjogador.text = "\(jogadoratual)"
                }
            }
        }


