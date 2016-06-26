import UIKit
import MMMarkdown
import Base64nl

class MyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!
    var picker = UIImagePickerController()
    var startTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        automaticallyAdjustsScrollViewInsets = false
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        let data = UIImageJPEGRepresentation(image, 0)
        startTime = CFAbsoluteTimeGetCurrent()
        let base64 = data!.base64EncodedString()
        print("Time elapsed for encoding: \(CFAbsoluteTimeGetCurrent() - startTime)")
        webView.loadHTMLString("<img src=\"data:image/jpg;base64,\(base64)\" style=\"max-width: 100%\"/> Lorem ipsum ad qui amet dolore, vitae cetero quaerendum mel ea. Facilis fastidii duo no. Viris partiendo ius no, alia animal nam at. Feugait imperdiet ius an, no quis facer lucilius vis. Aliquam saperet contentiones ex pro, id idque offendit ius. Fugit suavitate ad eam, ut essent debitis cum. Cu duo iudico instructior. Sea te choro perfecto, per eu meis nonumy percipit. Ut mea sint constituam, cu pro impedit constituam. Et diam wisi tollit mel, te has atqui veritus. Falli volumus ullamcorper id vis, fugit debet ei pri. Mea esse saperet oporteat cu, sumo interesset an cum. Facer expetenda ius te, sint mundi aperiri no est, mollis salutandi quo ne. No dicta errem sed. Mea ei detraxit patrioque, sumo eirmod ea vix. Et dicit omittantur eam, et vix modo eius vidit. Vis et pertinacia abhorreant constituam, eum at quod vero. Ferri consectetuer sed no, ex vix nonumy posidonium quaerendum. Eum in nostro omnesque philosophia, sit veniam recteque et. Et sit facer honestatis, sonet propriae officiis ne vel, est atqui verear eruditi eu. Ut duo augue deserunt mnesarchum, an per option dignissim, cu cum convenire consulatu deterruisset. Cu vel debet ludus, docendi nominati philosophia ex his. Ad legendos expetendis duo, sed et delicata pericula torquatos. Temporibus delicatissimi eu nam, mel ea ipsum fabulas tractatos, at vim omnis clita omittantur. Ad graeco scriptorem eos. Nam ut nulla congue singulis. Ea his doctus interpretaris, at qui aliquyam complectitur. Vix hinc habeo appareat an, at modo regione tamquam sed. Vim et tritani viderer, puto evertitur nam cu. Sed odio dicunt reprimique ex, ullum noluisse instructior ei sed, ei ius nostro corrumpit. Nec mundi equidem consulatu no. Sea an prodesset intellegat, usu dicit aperiam ut. Usu cu animal meliore. Platonem theophrastus duo ea, eum no alia ludus. Assentior referrentur quo ex. Usu id causae corrumpit patrioque, ei putant nonummy nec, ne nisl laudem petentium mea. Exerci instructior cu qui. Cum probo scribentur ut. Mei pertinax suscipiantur an. Nisl pertinax ex quo, eos esse ornatus at. Usu quidam definitionem no, eu mel quem mazim pertinax. Quodsi percipit consetetur at vim, eam omnis option explicari et. Pri at liber labores, his an utinam labore aperiam. Ei eos justo omnesque reformidans. Inani detraxit voluptatum ut pro. An sit posse probatus inimicus. Magna vivendo deseruisse has at, meis modus molestiae an has. Eam iudicabit constituam mediocritatem ne.", baseURL: nil)
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        startTime = CFAbsoluteTimeGetCurrent()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("Time elapsed for loading HTML: \(CFAbsoluteTimeGetCurrent() - startTime)")
    }
}
