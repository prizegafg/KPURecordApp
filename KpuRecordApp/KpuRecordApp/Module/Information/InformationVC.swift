//
//  InformationVC.swift
//  KpuRecordApp
//
//  Created by Prizega  on 22/08/23.
//

import UIKit

class InformationVC: UIViewController {
    @IBOutlet weak var navigation: NavigationBar!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    var presenter: VTPInformationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        navigation.setTitle("Information")
        navigation.delegate = self
        
        lblTitle.text = "Jadwal Pemilu 2024 Sudah Ditetapkan, Presiden Pastikan Tak Ada Penundaan"
        lblDetail.text = "Bogor, Kominfo - Presiden Joko Widodo memimpin rapat terbatas (ratas) yang membahas tentang persiapan pemilihan umum (pemilu) dan pemilihan kepala daerah (pilkada) serentak tahun 2024 bersama jajarannya di Istana Kepresidenan Bogor, Minggu (10/04/2022). Dalam arahannya, Presiden meminta jajarannya menyampaikan kepada publik bahwa jadwal pelaksanaan Pemilu dan pilkada serentak sudah ditetapkan agar tidak muncul isu lain seperti adanya upaya penundaan pemilu di masyarakat. “Saya kira sudah jelas semuanya sudah tahu bahwa pemilu akan dilaksanakan 14 Februari 2024. Ini perlu dijelaskan jangan sampai nanti muncul spekulasi-spekulasi yang isunya beredar di masyarakat bahwa pemerintah tengah berupaya untuk melakukan penundaan pemilu atau spekulasi mengenai perpanjangan jabatan Presiden dan juga yang berkaitan dengan soal tiga periode. Karena jelas bahwa kita telah sepakat pemilu dilaksanakan tanggal 14 Februari dan pilkada dilaksanakan nanti di November 2024, sudah jelas semuanya,” ujar Presiden. Presiden juga menjelaskan bahwa tahapan pemilu tahun 2024 sudah akan dimulai di pertengahan bulan Juni 2022. Hal tersebut sesuai dengan ketentuan Pasal 167 ayat (6) Undang-Undang Nomor 7 Tahun 2017 (UU Pemilu) yang menyebut bahwa tahapan penyelenggaraan pemilu dimulai 20 bulan sebelum hari pemungutan suara. Kepala Negara juga menyampaikan bahwa pada 12 April 2022 nanti, Komisi Pemilihan Umum (KPU) dan Badan Pengawas Pemilihan Umum (Bawaslu) periode 2022-2027 akan dilantik untuk segera mempersiapkan pemilu dan pilkada serentak 2024. Oleh karena itu, pemerintah akan segera membahas berbagai persiapan pemilu dan pilkada dengan kedua institusi tersebut. “Nanti kita perlu berbicara dengan KPU dan juga Bawaslu mengenai persiapan-persiapan ini agar persiapan Pemilu dan Pilkada yang ini kita belum punya pengalaman serentak itu betul-betul bisa kita persiapkan dengan matang,” imbuhnya. Di samping itu, Presiden juga meminta jajarannya untuk segera menyelesaikan payung hukum regulasi yang dibutuhkan untuk pemilu dan pilkada serentak 2024. Presiden meminta Menteri Koordinator Bidang Politik, Hukum, dan Keamanan (Menko Polhukam) Mahfud Md., untuk berkomunikasi secara intens dengan DPR RI dan KPU sehingga perencanaan programnya bisa didetailkan. “Didetail lagi dan sehingga regulasi yang ada yang disusun ini tidak multitafsir dan nanti bisa menimbulkan perselisihan di lapangan,” ungkapnya. Hadir dalam rapat tersebut yaitu Menteri Koordinator Bidang Politik, Hukum, dan Keamanan Mahfud Md., Menteri Koordinator Bidang Perekonomian Airlangga Hartarto, Menteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan Muhadjir Effendy, Menteri Koordinator Bidang Kemaritiman dan Investasi Luhut Binsar Pandjaitan, Menteri Sekretaris Negara Pratikno, Menteri Dalam Negeri Tito Karnavian, Menteri Hukum dan HAM Yasonna Laoly, Menteri PAN-RB Tjahjo Kumolo, Sekretaris Kabinet Pramono Anung, Panglima TNI Jenderal Andika Perkasa, Kapolri Jenderal Pol. Listyo Sigit Prabowo, dan Kepala Badan Intelijen Negara Budi Gunawan. "
    }


}

extension InformationVC: PTVInformationProtocol, NavigationBarDelegate{
    func pressBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
