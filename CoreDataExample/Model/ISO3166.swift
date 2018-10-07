//
//  ISO3166.swift
//  CoreDataExample
//
//  Created by Sargis on 10/7/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation

struct ISO3166 {
    enum Country: Int16 {
        case ala = 248
        case afg = 004
        case alb = 008
        case dza = 012
        case asm = 016
        case and = 020
        case ago = 024
        case aia = 660
        case ata = 010
        case atg = 028
        case arg = 032
        case arm = 051
        case abw = 533
        case aus = 036
        case aut = 040
        case aze = 031
        case bhs = 044
        case bhr = 048
        case bgd = 050
        case brb = 052
        case blr = 112
        case bel = 056
        case blz = 084
        case ben = 204
        case bmu = 060
        case btn = 064
        case bol = 068
        case bih = 070
        case bwa = 072
        case bvt = 074
        case bra = 076
        case iot = 086
        case brn = 096
        case bgr = 100
        case bfa = 854
        case bdi = 108
        case khm = 116
        case cmr = 120
        case can = 124
        case cpv = 132
        case cym = 136
        case caf = 140
        case tcd = 148
        case chl = 152
        case chn = 156
        case cxr = 162
        case cck = 166
        case col = 170
        case com = 174
        case cod = 180
        case cog = 178
        case cok = 184
        case cri = 188
        case civ = 384
        case hrv = 191
        case cub = 192
        case cyp = 196
        case cze = 203
        case dnk = 208
        case dji = 262
        case dma = 212
        case dom = 214
        case ecu = 218
        case egy = 818
        case slv = 222
        case gnq = 226
        case eri = 232
        case est = 233
        case eth = 231
        case flk = 238
        case fro = 234
        case fji = 242
        case fin = 246
        case fra = 250
        case guf = 254
        case pyf = 258
        case atf = 260
        case gab = 266
        case gmb = 270
        case geo = 268
        case deu = 276
        case gha = 288
        case gib = 292
        case grc = 300
        case grl = 304
        case grd = 308
        case glp = 312
        case gum = 316
        case gtm = 320
        case gin = 324
        case gnb = 624
        case guy = 328
        case hti = 332
        case hmd = 334
        case hnd = 340
        case hkg = 344
        case hun = 348
        case isl = 352
        case ind = 356
        case idn = 360
        case irn = 364
        case irq = 368
        case irl = 372
        case isr = 376
        case ita = 380
        case jam = 388
        case jpn = 392
        case jor = 400
        case kaz = 398
        case ken = 404
        case kir = 296
        case prk = 408
        case kor = 410
        case kwt = 414
        case kgz = 417
        case lao = 418
        case lva = 428
        case lbn = 422
        case lso = 426
        case lbr = 430
        case lby = 434
        case lie = 438
        case ltu = 440
        case lux = 442
        case mac = 446
        case mkd = 807
        case mdg = 450
        case mwi = 454
        case mys = 458
        case mdv = 462
        case mli = 466
        case mlt = 470
        case mhl = 584
        case mtq = 474
        case mrt = 478
        case mus = 480
        case myt = 175
        case mex = 484
        case fsm = 583
        case mda = 498
        case mco = 492
        case mng = 496
        case msr = 500
        case mar = 504
        case moz = 508
        case mmr = 104
        case nam = 516
        case nru = 520
        case npl = 524
        case nld = 528
        case ant = 530
        case ncl = 540
        case nzl = 554
        case nic = 558
        case ner = 562
        case nga = 566
        case niu = 570
        case nfk = 574
        case mnp = 580
        case nor = 578
        case omn = 512
        case pak = 586
        case plw = 585
        case pse = 275
        case pan = 591
        case png = 598
        case pry = 600
        case per = 604
        case phl = 608
        case pcn = 612
        case pol = 616
        case prt = 620
        case pri = 630
        case qat = 634
        case reu = 638
        case rou = 642
        case rus = 643
        case rwa = 646
        case shn = 654
        case kna = 659
        case lca = 662
        case spm = 666
        case vct = 670
        case wsm = 882
        case smr = 674
        case stp = 678
        case sau = 682
        case sen = 686
        case scg = 891
        case syc = 690
        case sle = 694
        case sgp = 702
        case svk = 703
        case svn = 705
        case slb = 090
        case som = 706
        case zaf = 710
        case sgs = 239
        case esp = 724
        case lka = 144
        case sdn = 736
        case sur = 740
        case sjm = 744
        case swz = 748
        case swe = 752
        case che = 756
        case syr = 760
        case twn = 158
        case tjk = 762
        case tza = 834
        case tha = 764
        case tls = 626
        case tgo = 768
        case tkl = 772
        case ton = 776
        case tto = 780
        case tun = 788
        case tur = 792
        case tkm = 795
        case tca = 796
        case tuv = 798
        case uga = 800
        case ukr = 804
        case are = 784
        case gbr = 826
        case usa = 840
        case umi = 581
        case ury = 858
        case uzb = 860
        case vut = 548
        case vat = 336
        case ven = 862
        case vnm = 704
        case vgb = 092
        case vir = 850
        case wlf = 876
        case esh = 732
        case yem = 887
        case zmb = 894
        case zwe = 716
        case unknown = 0
    }
    
    enum Continent: Int16 {
        case na = 10001
        case an = 10002
        case eu = 10003
        case af = 10004
        case `as` = 10005
        case sa = 10006
        case oc = 10007
    }
}

private let countriesAndContinents: [(ISO3166.Continent, ISO3166.Country)] = [
    (.as, .guy),
    (.eu, .pol),
    (.an, .ltu),
    (.af, .nic),
    (.oc, .isl)
]

extension ISO3166.Continent {
    init?(country: ISO3166.Country) {
        let cc = countriesAndContinents.first { $0.1 == country }
        guard let (continent, _) = cc else { return nil }
        self = continent
    }
}

extension ISO3166.Country {
    static func fromISO3166(_ s: String) -> ISO3166.Country {
        switch (s.lowercased()) {
        case "guy": return .guy
        case "pol": return .pol
        case "ltu": return .ltu
        case "nic": return .nic
        case "isl": return .isl
        default: return .unknown
        }
    }
}
