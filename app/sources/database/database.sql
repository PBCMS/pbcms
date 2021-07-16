-- phpMyAdmin SQL Dump
-- version 4.9.7deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 16, 2021 at 03:23 PM
-- Server version: 10.5.10-MariaDB-0ubuntu0.21.04.1
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `pb_media`
--

CREATE TABLE `pb_media` (
  `id` int(11) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `ext` varchar(16) NOT NULL,
  `type` varchar(1024) NOT NULL,
  `owner` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_media-extensions`
--

CREATE TABLE `pb_media-extensions` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `mime` varchar(1024) NOT NULL,
  `extension` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_media-extensions`
--

INSERT INTO `pb_media-extensions` (`id`, `name`, `mime`, `extension`) VALUES
(1, '3D Crossword Plugin', 'application/vnd.hzn-3d-crossword', 'x3d'),
(2, '3GP', 'video/3gpp', '3gp'),
(3, '3GP2', 'video/3gpp2', '3g2'),
(4, '3GPP MSEQ File', 'application/vnd.mseq', 'mseq'),
(5, '3M Post It Notes', 'application/vnd.3m.post-it-notes', 'pwn'),
(6, '3rd Generation Partnership Project - Pic Large', 'application/vnd.3gpp.pic-bw-large', 'plb'),
(7, '3rd Generation Partnership Project - Pic Small', 'application/vnd.3gpp.pic-bw-small', 'psb'),
(8, '3rd Generation Partnership Project - Pic Var', 'application/vnd.3gpp.pic-bw-var', 'pvb'),
(9, '3rd Generation Partnership Project - Transaction Capabilities Application Part', 'application/vnd.3gpp2.tcap', 'tcap'),
(10, '7-Zip', 'application/x-7z-compressed', '7z'),
(11, 'AbiWord', 'application/x-abiword', 'abw'),
(12, 'Ace Archive', 'application/x-ace-compressed', 'ace'),
(13, 'Active Content Compression', 'application/vnd.americandynamics.acc', 'acc'),
(14, 'ACU Cobol', 'application/vnd.acucobol', 'acu'),
(15, 'ACU Cobol', 'application/vnd.acucorp', 'atc'),
(16, 'Adaptive differential pulse-code modulation', 'audio/adpcm', 'adp'),
(17, 'Adobe (Macropedia) Authorware - Binary File', 'application/x-authorware-bin', 'aab'),
(18, 'Adobe (Macropedia) Authorware - Map', 'application/x-authorware-map', 'aam'),
(19, 'Adobe (Macropedia) Authorware - Segment File', 'application/x-authorware-seg', 'aas'),
(20, 'Adobe AIR Application', 'application/vnd.adobe.air-application-installer-package+zip', 'air'),
(21, 'Adobe Flash', 'application/x-shockwave-flash', 'swf'),
(22, 'Adobe Flex Project', 'application/vnd.adobe.fxp', 'fxp'),
(23, 'Adobe Portable Document Format', 'application/pdf', 'pdf'),
(24, 'Adobe PostScript Printer Description File Format', 'application/vnd.cups-ppd', 'ppd'),
(25, 'Adobe Shockwave Player', 'application/x-director', 'dir'),
(26, 'Adobe XML Data Package', 'application/vnd.adobe.xdp+xml', 'xdp'),
(27, 'Adobe XML Forms Data Format', 'application/vnd.adobe.xfdf', 'xfdf'),
(28, 'Advanced Audio Coding (AAC)', 'audio/x-aac', 'aac'),
(29, 'Ahead AIR Application', 'application/vnd.ahead.space', 'ahead'),
(30, 'AirZip FileSECURE', 'application/vnd.airzip.filesecure.azf', 'azf'),
(31, 'AirZip FileSECURE', 'application/vnd.airzip.filesecure.azs', 'azs'),
(32, 'Amazon Kindle eBook format', 'application/vnd.amazon.ebook', 'azw'),
(33, 'AmigaDE', 'application/vnd.amiga.ami', 'ami'),
(34, 'Andrew Toolkit', 'application/andrew-inset', '/A'),
(35, 'Android Package Archive', 'application/vnd.android.package-archive', 'apk'),
(36, 'ANSER-WEB Terminal Client - Certificate Issue', 'application/vnd.anser-web-certificate-issue-initiation', 'cii'),
(37, 'ANSER-WEB Terminal Client - Web Funds Transfer', 'application/vnd.anser-web-funds-transfer-initiation', 'fti'),
(38, 'Antix Game Player', 'application/vnd.antix.game-component', 'atx'),
(39, 'Apple Disk Image', 'application/x-apple-diskimage', 'dmg'),
(40, 'Apple Installer Package', 'application/vnd.apple.installer+xml', 'mpkg'),
(41, 'Applixware', 'application/applixware', 'aw'),
(42, 'Archipelago Lesson Player', 'application/vnd.hhe.lesson-player', 'les'),
(43, 'Arista Networks Software Image', 'application/vnd.aristanetworks.swi', 'swi'),
(44, 'Assembler Source File', 'text/x-asm', 's'),
(45, 'Atom Publishing Protocol', 'application/atomcat+xml', 'atomcat'),
(46, 'Atom Publishing Protocol Service Document', 'application/atomsvc+xml', 'atomsvc'),
(47, 'Atom Syndication Format', 'application/atom+xml', 'atom'),
(48, 'Atom Syndication Format', 'application/atom+xml', 'xml'),
(49, 'Attribute Certificate', 'application/pkix-attr-cert', 'ac'),
(50, 'Audio Interchange File Format', 'audio/x-aiff', 'aif'),
(51, 'Audio Video Interleave (AVI)', 'video/x-msvideo', 'avi'),
(52, 'Audiograph', 'application/vnd.audiograph', 'aep'),
(53, 'AutoCAD DXF', 'image/vnd.dxf', 'dxf'),
(54, 'Autodesk Design Web Format (DWF)', 'model/vnd.dwf', 'dwf'),
(55, 'BAS Partitur Format', 'text/plain-bas', 'par'),
(56, 'Binary CPIO Archive', 'application/x-bcpio', 'bcpio'),
(57, 'Binary Data', 'application/octet-stream', 'bin'),
(58, 'Bitmap Image File', 'image/bmp', 'bmp'),
(59, 'BitTorrent', 'application/x-bittorrent', 'torrent'),
(60, 'Blackberry COD File', 'application/vnd.rim.cod', 'cod'),
(61, 'Blueice Research Multipass', 'application/vnd.blueice.multipass', 'mpm'),
(62, 'BMI Drawing Data Interchange', 'application/vnd.bmi', 'bmi'),
(63, 'Bourne Shell Script', 'application/x-sh', 'sh'),
(64, 'BTIF', 'image/prs.btif', 'btif'),
(65, 'BusinessObjects', 'application/vnd.businessobjects', 'rep'),
(66, 'Bzip Archive', 'application/x-bzip', 'bz'),
(67, 'Bzip2 Archive', 'application/x-bzip2', 'bz2'),
(68, 'C Shell Script', 'application/x-csh', 'csh'),
(69, 'C Source File', 'text/x-c', 'c'),
(70, 'CambridgeSoft Chem Draw', 'application/vnd.chemdraw+xml', 'cdxml'),
(71, 'Cascading Style Sheets (CSS)', 'text/css', 'css'),
(72, 'ChemDraw eXchange file', 'chemical/x-cdx', 'cdx'),
(73, 'Chemical Markup Language', 'chemical/x-cml', 'cml'),
(74, 'Chemical Style Markup Language', 'chemical/x-csml', 'csml'),
(75, 'CIM Database', 'application/vnd.contact.cmsg', 'cdbcmsg'),
(76, 'Claymore Data Files', 'application/vnd.claymore', 'cla'),
(77, 'Clonk Game', 'application/vnd.clonk.c4group', 'c4g'),
(78, 'Close Captioning - Subtitle', 'image/vnd.dvb.subtitle', 'sub'),
(79, 'Cloud Data Management Interface (CDMI) - Capability', 'application/cdmi-capability', 'cdmia'),
(80, 'Cloud Data Management Interface (CDMI) - Contaimer', 'application/cdmi-container', 'cdmic'),
(81, 'Cloud Data Management Interface (CDMI) - Domain', 'application/cdmi-domain', 'cdmid'),
(82, 'Cloud Data Management Interface (CDMI) - Object', 'application/cdmi-object', 'cdmio'),
(83, 'Cloud Data Management Interface (CDMI) - Queue', 'application/cdmi-queue', 'cdmiq'),
(84, 'ClueTrust CartoMobile - Config', 'application/vnd.cluetrust.cartomobile-config', 'c11amc'),
(85, 'ClueTrust CartoMobile - Config Package', 'application/vnd.cluetrust.cartomobile-config-pkg', 'c11amz'),
(86, 'CMU Image', 'image/x-cmu-raster', 'ras'),
(87, 'COLLADA', 'model/vnd.collada+xml', 'dae'),
(88, 'Comma-Seperated Values', 'text/csv', 'csv'),
(89, 'Compact Pro', 'application/mac-compactpro', 'cpt'),
(90, 'Compiled Wireless Markup Language (WMLC)', 'application/vnd.wap.wmlc', 'wmlc'),
(91, 'Computer Graphics Metafile', 'image/cgm', 'cgm'),
(92, 'CoolTalk', 'x-conference/x-cooltalk', 'ice'),
(93, 'Corel Metafile Exchange (CMX)', 'image/x-cmx', 'cmx'),
(94, 'CorelXARA', 'application/vnd.xara', 'xar'),
(95, 'CosmoCaller', 'application/vnd.cosmocaller', 'cmc'),
(96, 'CPIO Archive', 'application/x-cpio', 'cpio'),
(97, 'CrickSoftware - Clicker', 'application/vnd.crick.clicker', 'clkx'),
(98, 'CrickSoftware - Clicker - Keyboard', 'application/vnd.crick.clicker.keyboard', 'clkk'),
(99, 'CrickSoftware - Clicker - Palette', 'application/vnd.crick.clicker.palette', 'clkp'),
(100, 'CrickSoftware - Clicker - Template', 'application/vnd.crick.clicker.template', 'clkt'),
(101, 'CrickSoftware - Clicker - Wordbank', 'application/vnd.crick.clicker.wordbank', 'clkw'),
(102, 'Critical Tools - PERT Chart EXPERT', 'application/vnd.criticaltools.wbs+xml', 'wbs'),
(103, 'CryptoNote', 'application/vnd.rig.cryptonote', 'cryptonote'),
(104, 'Crystallographic Interchange Format', 'chemical/x-cif', 'cif'),
(105, 'CrystalMaker Data Format', 'chemical/x-cmdf', 'cmdf'),
(106, 'CU-SeeMe', 'application/cu-seeme', 'cu'),
(107, 'CU-Writer', 'application/prs.cww', 'cww'),
(108, 'Curl - Applet', 'text/vnd.curl', 'curl'),
(109, 'Curl - Detached Applet', 'text/vnd.curl.dcurl', 'dcurl'),
(110, 'Curl - Manifest File', 'text/vnd.curl.mcurl', 'mcurl'),
(111, 'Curl - Source Code', 'text/vnd.curl.scurl', 'scurl'),
(112, 'CURL Applet', 'application/vnd.curl.car', 'car'),
(113, 'CURL Applet', 'application/vnd.curl.pcurl', 'pcurl'),
(114, 'CustomMenu', 'application/vnd.yellowriver-custom-menu', 'cmp'),
(115, 'Data Structure for the Security Suitability of Cryptographic Algorithms', 'application/dssc+der', 'dssc'),
(116, 'Data Structure for the Security Suitability of Cryptographic Algorithms', 'application/dssc+xml', 'xdssc'),
(117, 'Debian Package', 'application/x-debian-package', 'deb'),
(118, 'DECE Audio', 'audio/vnd.dece.audio', 'uva'),
(119, 'DECE Graphic', 'image/vnd.dece.graphic', 'uvi'),
(120, 'DECE High Definition Video', 'video/vnd.dece.hd', 'uvh'),
(121, 'DECE Mobile Video', 'video/vnd.dece.mobile', 'uvm'),
(122, 'DECE MP4', 'video/vnd.uvvu.mp4', 'uvu'),
(123, 'DECE PD Video', 'video/vnd.dece.pd', 'uvp'),
(124, 'DECE SD Video', 'video/vnd.dece.sd', 'uvs'),
(125, 'DECE Video', 'video/vnd.dece.video', 'uvv'),
(126, 'Device Independent File Format (DVI)', 'application/x-dvi', 'dvi'),
(127, 'Digital Siesmograph Networks - SEED Datafiles', 'application/vnd.fdsn.seed', 'seed'),
(128, 'Digital Talking Book', 'application/x-dtbook+xml', 'dtb'),
(129, 'Digital Talking Book - Resource File', 'application/x-dtbresource+xml', 'res'),
(130, 'Digital Video Broadcasting', 'application/vnd.dvb.ait', 'ait'),
(131, 'Digital Video Broadcasting', 'application/vnd.dvb.service', 'svc'),
(132, 'Digital Winds Music', 'audio/vnd.digital-winds', 'eol'),
(133, 'DjVu', 'image/vnd.djvu', 'djvu'),
(134, 'Document Type Definition', 'application/xml-dtd', 'dtd'),
(135, 'Dolby Meridian Lossless Packing', 'application/vnd.dolby.mlp', 'mlp'),
(136, 'Doom Video Game', 'application/x-doom', 'wad'),
(137, 'DPGraph', 'application/vnd.dpgraph', 'dpg'),
(138, 'DRA Audio', 'audio/vnd.dra', 'dra'),
(139, 'DreamFactory', 'application/vnd.dreamfactory', 'dfac'),
(140, 'DTS Audio', 'audio/vnd.dts', 'dts'),
(141, 'DTS High Definition Audio', 'audio/vnd.dts.hd', 'dtshd'),
(142, 'DWG Drawing', 'image/vnd.dwg', 'dwg'),
(143, 'DynaGeo', 'application/vnd.dynageo', 'geo'),
(144, 'ECMAScript', 'application/ecmascript', 'es'),
(145, 'EcoWin Chart', 'application/vnd.ecowin.chart', 'mag'),
(146, 'EDMICS 2000', 'image/vnd.fujixerox.edmics-mmr', 'mmr'),
(147, 'EDMICS 2000', 'image/vnd.fujixerox.edmics-rlc', 'rlc'),
(148, 'Efficient XML Interchange', 'application/exi', 'exi'),
(149, 'EFI Proteus', 'application/vnd.proteus.magazine', 'mgz'),
(150, 'Electronic Publication', 'application/epub+zip', 'epub'),
(151, 'Email Message', 'message/rfc822', 'eml'),
(152, 'Enliven Viewer', 'application/vnd.enliven', 'nml'),
(153, 'Express by Infoseek', 'application/vnd.is-xpr', 'xpr'),
(154, 'eXtended Image File Format (XIFF)', 'image/vnd.xiff', 'xif'),
(155, 'Extensible Forms Description Language', 'application/vnd.xfdl', 'xfdl'),
(156, 'Extensible MultiModal Annotation', 'application/emma+xml', 'emma'),
(157, 'EZPix Secure Photo Album', 'application/vnd.ezpix-album', 'ez2'),
(158, 'EZPix Secure Photo Album', 'application/vnd.ezpix-package', 'ez3'),
(159, 'FAST Search & Transfer ASA', 'image/vnd.fst', 'fst'),
(160, 'FAST Search & Transfer ASA', 'video/vnd.fvt', 'fvt'),
(161, 'FastBid Sheet', 'image/vnd.fastbidsheet', 'fbs'),
(162, 'FCS Express Layout Link', 'application/vnd.denovo.fcselayout-link', 'fe_launch'),
(163, 'Flash Video', 'video/x-f4v', 'f4v'),
(164, 'Flash Video', 'video/x-flv', 'flv'),
(165, 'FlashPix', 'image/vnd.fpx', 'fpx'),
(166, 'FlashPix', 'image/vnd.net-fpx', 'npx'),
(167, 'FLEXSTOR', 'text/vnd.fmi.flexstor', 'flx'),
(168, 'FLI/FLC Animation Format', 'video/x-fli', 'fli'),
(169, 'FluxTime Clip', 'application/vnd.fluxtime.clip', 'ftc'),
(170, 'Forms Data Format', 'application/vnd.fdf', 'fdf'),
(171, 'Fortran Source File', 'text/x-fortran', 'f'),
(172, 'FrameMaker Interchange Format', 'application/vnd.mif', 'mif'),
(173, 'FrameMaker Normal Format', 'application/vnd.framemaker', 'fm'),
(174, 'FreeHand MX', 'image/x-freehand', 'fh'),
(175, 'Friendly Software Corporation', 'application/vnd.fsc.weblaunch', 'fsc'),
(176, 'Frogans Player', 'application/vnd.frogans.fnc', 'fnc'),
(177, 'Frogans Player', 'application/vnd.frogans.ltf', 'ltf'),
(178, 'Fujitsu - Xerox 2D CAD Data', 'application/vnd.fujixerox.ddd', 'ddd'),
(179, 'Fujitsu - Xerox DocuWorks', 'application/vnd.fujixerox.docuworks', 'xdw'),
(180, 'Fujitsu - Xerox DocuWorks Binder', 'application/vnd.fujixerox.docuworks.binder', 'xbd'),
(181, 'Fujitsu Oasys', 'application/vnd.fujitsu.oasys', 'oas'),
(182, 'Fujitsu Oasys', 'application/vnd.fujitsu.oasys2', 'oa2'),
(183, 'Fujitsu Oasys', 'application/vnd.fujitsu.oasys3', 'oa3'),
(184, 'Fujitsu Oasys', 'application/vnd.fujitsu.oasysgp', 'fg5'),
(185, 'Fujitsu Oasys', 'application/vnd.fujitsu.oasysprs', 'bh2'),
(186, 'FutureSplash Animator', 'application/x-futuresplash', 'spl'),
(187, 'FuzzySheet', 'application/vnd.fuzzysheet', 'fzs'),
(188, 'G3 Fax Image', 'image/g3fax', 'g3'),
(189, 'GameMaker ActiveX', 'application/vnd.gmx', 'gmx'),
(190, 'Gen-Trix Studio', 'model/vnd.gtw', 'gtw'),
(191, 'Genomatix Tuxedo Framework', 'application/vnd.genomatix.tuxedo', 'txd'),
(192, 'GeoGebra', 'application/vnd.geogebra.file', 'ggb'),
(193, 'GeoGebra', 'application/vnd.geogebra.tool', 'ggt'),
(194, 'Geometric Description Language (GDL)', 'model/vnd.gdl', 'gdl'),
(195, 'GeoMetry Explorer', 'application/vnd.geometry-explorer', 'gex'),
(196, 'GEONExT and JSXGraph', 'application/vnd.geonext', 'gxt'),
(197, 'GeoplanW', 'application/vnd.geoplan', 'g2w'),
(198, 'GeospacW', 'application/vnd.geospace', 'g3w'),
(199, 'Ghostscript Font', 'application/x-font-ghostscript', 'gsf'),
(200, 'Glyph Bitmap Distribution Format', 'application/x-font-bdf', 'bdf'),
(201, 'GNU Tar Files', 'application/x-gtar', 'gtar'),
(202, 'GNU Texinfo Document', 'application/x-texinfo', 'texinfo'),
(203, 'Gnumeric', 'application/x-gnumeric', 'gnumeric'),
(204, 'Google Earth - KML', 'application/vnd.google-earth.kml+xml', 'kml'),
(205, 'Google Earth - Zipped KML', 'application/vnd.google-earth.kmz', 'kmz'),
(206, 'GPS eXchange Format', 'application/gpx+xml', 'gpx'),
(207, 'GrafEq', 'application/vnd.grafeq', 'gqf'),
(208, 'Graphics Interchange Format', 'image/gif', 'gif'),
(209, 'Graphviz', 'text/vnd.graphviz', 'gv'),
(210, 'Groove - Account', 'application/vnd.groove-account', 'gac'),
(211, 'Groove - Help', 'application/vnd.groove-help', 'ghf'),
(212, 'Groove - Identity Message', 'application/vnd.groove-identity-message', 'gim'),
(213, 'Groove - Injector', 'application/vnd.groove-injector', 'grv'),
(214, 'Groove - Tool Message', 'application/vnd.groove-tool-message', 'gtm'),
(215, 'Groove - Tool Template', 'application/vnd.groove-tool-template', 'tpl'),
(216, 'Groove - Vcard', 'application/vnd.groove-vcard', 'vcg'),
(217, 'H.261', 'video/h261', 'h261'),
(218, 'H.263', 'video/h263', 'h263'),
(219, 'H.264', 'video/h264', 'h264'),
(220, 'Hewlett Packard Instant Delivery', 'application/vnd.hp-hpid', 'hpid'),
(221, 'Hierarchical Data Format', 'application/x-hdf', 'hdf'),
(222, 'Homebanking Computer Interface (HBCI)', 'application/vnd.hbci', 'hbci'),
(223, 'HP Indigo Digital Press - Job Layout Languate', 'application/vnd.hp-jlyt', 'jlt'),
(224, 'HP Printer Command Language', 'application/vnd.hp-pcl', 'pcl'),
(225, 'HP-GL/2 and HP RTL', 'application/vnd.hp-hpgl', 'hpgl'),
(226, 'HV Script', 'application/vnd.yamaha.hv-script', 'hvs'),
(227, 'HV Voice Dictionary', 'application/vnd.yamaha.hv-dic', 'hvd'),
(228, 'HV Voice Parameter', 'application/vnd.yamaha.hv-voice', 'hvp'),
(229, 'Hydrostatix Master Suite', 'application/vnd.hydrostatix.sof-data', 'sfd-hdstx'),
(230, 'Hyperstudio', 'application/hyperstudio', 'stk'),
(231, 'Hypertext Application Language', 'application/vnd.hal+xml', 'hal'),
(232, 'HyperText Markup Language (HTML)', 'text/html', 'html'),
(233, 'IBM DB2 Rights Manager', 'application/vnd.ibm.rights-management', 'irm'),
(234, 'IBM Electronic Media Management System - Secure Container', 'application/vnd.ibm.secure-container', 'sc'),
(235, 'iCalendar', 'text/calendar', 'ics'),
(236, 'ICC profile', 'application/vnd.iccprofile', 'icc'),
(237, 'Icon Image', 'image/x-icon', 'ico'),
(238, 'igLoader', 'application/vnd.igloader', 'igl'),
(239, 'Image Exchange Format', 'image/ief', 'ief'),
(240, 'ImmerVision PURE Players', 'application/vnd.immervision-ivp', 'ivp'),
(241, 'ImmerVision PURE Players', 'application/vnd.immervision-ivu', 'ivu'),
(242, 'IMS Networks', 'application/reginfo+xml', 'rif'),
(243, 'In3D - 3DML', 'text/vnd.in3d.3dml', '3dml'),
(244, 'In3D - 3DML', 'text/vnd.in3d.spot', 'spot'),
(245, 'Initial Graphics Exchange Specification (IGES)', 'model/iges', 'igs'),
(246, 'Interactive Geometry Software', 'application/vnd.intergeo', 'i2g'),
(247, 'Interactive Geometry Software Cinderella', 'application/vnd.cinderella', 'cdy'),
(248, 'Intercon FormNet', 'application/vnd.intercon.formnet', 'xpw'),
(249, 'International Society for Advancement of Cytometry', 'application/vnd.isac.fcs', 'fcs'),
(250, 'Internet Protocol Flow Information Export', 'application/ipfix', 'ipfix'),
(251, 'Internet Public Key Infrastructure - Certificate', 'application/pkix-cert', 'cer'),
(252, 'Internet Public Key Infrastructure - Certificate Management Protocole', 'application/pkixcmp', 'pki'),
(253, 'Internet Public Key Infrastructure - Certificate Revocation Lists', 'application/pkix-crl', 'crl'),
(254, 'Internet Public Key Infrastructure - Certification Path', 'application/pkix-pkipath', 'pkipath'),
(255, 'IOCOM Visimeet', 'application/vnd.insors.igm', 'igm'),
(256, 'IP Unplugged Roaming Client', 'application/vnd.ipunplugged.rcprofile', 'rcprofile'),
(257, 'iRepository / Lucidoc Editor', 'application/vnd.irepository.package+xml', 'irp'),
(258, 'J2ME App Descriptor', 'text/vnd.sun.j2me.app-descriptor', 'jad'),
(259, 'Java Archive', 'application/java-archive', 'jar'),
(260, 'Java Bytecode File', 'application/java-vm', 'class'),
(261, 'Java Network Launching Protocol', 'application/x-java-jnlp-file', 'jnlp'),
(262, 'Java Serialized Object', 'application/java-serialized-object', 'ser'),
(263, 'Java Source File', 'text/x-java-source,java', 'java'),
(264, 'JavaScript', 'application/javascript', 'js'),
(265, 'JavaScript Object Notation (JSON)', 'application/json', 'json'),
(266, 'Joda Archive', 'application/vnd.joost.joda-archive', 'joda'),
(267, 'JPEG 2000 Compound Image File Format', 'video/jpm', 'jpm'),
(268, 'JPEG Image', 'image/jpeg', 'jpeg'),
(269, 'JPEG Image', 'image/jpeg', 'jpg'),
(270, 'JPEG Image (Citrix client)', 'image/x-citrix-jpeg', 'jpeg'),
(271, 'JPEG Image (Citrix client)', 'image/x-citrix-jpeg', 'jpg'),
(272, 'JPEG Image (Progressive)', 'image/pjpeg', 'pjpeg'),
(273, 'JPGVideo', 'video/jpeg', 'jpgv'),
(274, 'Kahootz', 'application/vnd.kahootz', 'ktz'),
(275, 'Karaoke on Chipnuts Chipsets', 'application/vnd.chipnuts.karaoke-mmd', 'mmd'),
(276, 'KDE KOffice Office Suite - Karbon', 'application/vnd.kde.karbon', 'karbon'),
(277, 'KDE KOffice Office Suite - KChart', 'application/vnd.kde.kchart', 'chrt'),
(278, 'KDE KOffice Office Suite - Kformula', 'application/vnd.kde.kformula', 'kfo'),
(279, 'KDE KOffice Office Suite - Kivio', 'application/vnd.kde.kivio', 'flw'),
(280, 'KDE KOffice Office Suite - Kontour', 'application/vnd.kde.kontour', 'kon'),
(281, 'KDE KOffice Office Suite - Kpresenter', 'application/vnd.kde.kpresenter', 'kpr'),
(282, 'KDE KOffice Office Suite - Kspread', 'application/vnd.kde.kspread', 'ksp'),
(283, 'KDE KOffice Office Suite - Kword', 'application/vnd.kde.kword', 'kwd'),
(284, 'Kenamea App', 'application/vnd.kenameaapp', 'htke'),
(285, 'Kidspiration', 'application/vnd.kidspiration', 'kia'),
(286, 'Kinar Applications', 'application/vnd.kinar', 'kne'),
(287, 'Kodak Storyshare', 'application/vnd.kodak-descriptor', 'sse'),
(288, 'Laser App Enterprise', 'application/vnd.las.las+xml', 'lasxml'),
(289, 'LaTeX', 'application/x-latex', 'latex'),
(290, 'Life Balance - Desktop Edition', 'application/vnd.llamagraphics.life-balance.desktop', 'lbd'),
(291, 'Life Balance - Exchange Format', 'application/vnd.llamagraphics.life-balance.exchange+xml', 'lbe'),
(292, 'Lightspeed Audio Lab', 'application/vnd.jam', 'jam'),
(293, 'Lotus 1-2-3', 'application/vnd.lotus-1-2-3', '123'),
(294, 'Lotus Approach', 'application/vnd.lotus-approach', 'apr'),
(295, 'Lotus Freelance', 'application/vnd.lotus-freelance', 'pre'),
(296, 'Lotus Notes', 'application/vnd.lotus-notes', 'nsf'),
(297, 'Lotus Organizer', 'application/vnd.lotus-organizer', 'org'),
(298, 'Lotus Screencam', 'application/vnd.lotus-screencam', 'scm'),
(299, 'Lotus Wordpro', 'application/vnd.lotus-wordpro', 'lwp'),
(300, 'Lucent Voice', 'audio/vnd.lucent.voice', 'lvp'),
(301, 'M3U (Multimedia Playlist)', 'audio/x-mpegurl', 'm3u'),
(302, 'M4v', 'video/x-m4v', 'm4v'),
(303, 'Macintosh BinHex 4.0', 'application/mac-binhex40', 'hqx'),
(304, 'MacPorts Port System', 'application/vnd.macports.portpkg', 'portpkg'),
(305, 'MapGuide DBXML', 'application/vnd.osgeo.mapguide.package', 'mgp'),
(306, 'MARC Formats', 'application/marc', 'mrc'),
(307, 'MARC21 XML Schema', 'application/marcxml+xml', 'mrcx'),
(308, 'Material Exchange Format', 'application/mxf', 'mxf'),
(309, 'Mathematica Notebook Player', 'application/vnd.wolfram.player', 'nbp'),
(310, 'Mathematica Notebooks', 'application/mathematica', 'ma'),
(311, 'Mathematical Markup Language', 'application/mathml+xml', 'mathml'),
(312, 'Mbox database files', 'application/mbox', 'mbox'),
(313, 'MedCalc', 'application/vnd.medcalcdata', 'mc1'),
(314, 'Media Server Control Markup Language', 'application/mediaservercontrol+xml', 'mscml'),
(315, 'MediaRemote', 'application/vnd.mediastation.cdkey', 'cdkey'),
(316, 'Medical Waveform Encoding Format', 'application/vnd.mfer', 'mwf'),
(317, 'Melody Format for Mobile Platform', 'application/vnd.mfmp', 'mfm'),
(318, 'Mesh Data Type', 'model/mesh', 'msh'),
(319, 'Metadata Authority Description Schema', 'application/mads+xml', 'mads'),
(320, 'Metadata Encoding and Transmission Standard', 'application/mets+xml', 'mets'),
(321, 'Metadata Object Description Schema', 'application/mods+xml', 'mods'),
(322, 'Metalink', 'application/metalink4+xml', 'meta4'),
(323, 'Micro CADAM Helix D&D', 'application/vnd.mcd', 'mcd'),
(324, 'Micrografx', 'application/vnd.micrografx.flo', 'flo'),
(325, 'Micrografx iGrafx Professional', 'application/vnd.micrografx.igx', 'igx'),
(326, 'MICROSEC e-Szignï¿½', 'application/vnd.eszigno3+xml', 'es3'),
(327, 'Microsoft Access', 'application/x-msaccess', 'mdb'),
(328, 'Microsoft Advanced Systems Format (ASF)', 'video/x-ms-asf', 'asf'),
(329, 'Microsoft Application', 'application/x-msdownload', 'exe'),
(330, 'Microsoft Artgalry', 'application/vnd.ms-artgalry', 'cil'),
(331, 'Microsoft Cabinet File', 'application/vnd.ms-cab-compressed', 'cab'),
(332, 'Microsoft Class Server', 'application/vnd.ms-ims', 'ims'),
(333, 'Microsoft ClickOnce', 'application/x-ms-application', 'application'),
(334, 'Microsoft Clipboard Clip', 'application/x-msclip', 'clp'),
(335, 'Microsoft Document Imaging Format', 'image/vnd.ms-modi', 'mdi'),
(336, 'Microsoft Embedded OpenType', 'application/vnd.ms-fontobject', 'eot'),
(337, 'Microsoft Excel', 'application/vnd.ms-excel', 'xls'),
(338, 'Microsoft Excel - Add-In File', 'application/vnd.ms-excel.addin.macroenabled.12', 'xlam'),
(339, 'Microsoft Excel - Binary Workbook', 'application/vnd.ms-excel.sheet.binary.macroenabled.12', 'xlsb'),
(340, 'Microsoft Excel - Macro-Enabled Template File', 'application/vnd.ms-excel.template.macroenabled.12', 'xltm'),
(341, 'Microsoft Excel - Macro-Enabled Workbook', 'application/vnd.ms-excel.sheet.macroenabled.12', 'xlsm'),
(342, 'Microsoft Html Help File', 'application/vnd.ms-htmlhelp', 'chm'),
(343, 'Microsoft Information Card', 'application/x-mscardfile', 'crd'),
(344, 'Microsoft Learning Resource Module', 'application/vnd.ms-lrm', 'lrm'),
(345, 'Microsoft MediaView', 'application/x-msmediaview', 'mvb'),
(346, 'Microsoft Money', 'application/x-msmoney', 'mny'),
(347, 'Microsoft Office - OOXML - Presentation', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'pptx'),
(348, 'Microsoft Office - OOXML - Presentation (Slide)', 'application/vnd.openxmlformats-officedocument.presentationml.slide', 'sldx'),
(349, 'Microsoft Office - OOXML - Presentation (Slideshow)', 'application/vnd.openxmlformats-officedocument.presentationml.slideshow', 'ppsx'),
(350, 'Microsoft Office - OOXML - Presentation Template', 'application/vnd.openxmlformats-officedocument.presentationml.template', 'potx'),
(351, 'Microsoft Office - OOXML - Spreadsheet', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'xlsx'),
(352, 'Microsoft Office - OOXML - Spreadsheet Template', 'application/vnd.openxmlformats-officedocument.spreadsheetml.template', 'xltx'),
(353, 'Microsoft Office - OOXML - Word Document', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'docx'),
(354, 'Microsoft Office - OOXML - Word Document Template', 'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 'dotx'),
(355, 'Microsoft Office Binder', 'application/x-msbinder', 'obd'),
(356, 'Microsoft Office System Release Theme', 'application/vnd.ms-officetheme', 'thmx'),
(357, 'Microsoft OneNote', 'application/onenote', 'onetoc'),
(358, 'Microsoft PlayReady Ecosystem', 'audio/vnd.ms-playready.media.pya', 'pya'),
(359, 'Microsoft PlayReady Ecosystem Video', 'video/vnd.ms-playready.media.pyv', 'pyv'),
(360, 'Microsoft PowerPoint', 'application/vnd.ms-powerpoint', 'ppt'),
(361, 'Microsoft PowerPoint - Add-in file', 'application/vnd.ms-powerpoint.addin.macroenabled.12', 'ppam'),
(362, 'Microsoft PowerPoint - Macro-Enabled Open XML Slide', 'application/vnd.ms-powerpoint.slide.macroenabled.12', 'sldm'),
(363, 'Microsoft PowerPoint - Macro-Enabled Presentation File', 'application/vnd.ms-powerpoint.presentation.macroenabled.12', 'pptm'),
(364, 'Microsoft PowerPoint - Macro-Enabled Slide Show File', 'application/vnd.ms-powerpoint.slideshow.macroenabled.12', 'ppsm'),
(365, 'Microsoft PowerPoint - Macro-Enabled Template File', 'application/vnd.ms-powerpoint.template.macroenabled.12', 'potm'),
(366, 'Microsoft Project', 'application/vnd.ms-project', 'mpp'),
(367, 'Microsoft Publisher', 'application/x-mspublisher', 'pub'),
(368, 'Microsoft Schedule+', 'application/x-msschedule', 'scd'),
(369, 'Microsoft Silverlight', 'application/x-silverlight-app', 'xap'),
(370, 'Microsoft Trust UI Provider - Certificate Trust Link', 'application/vnd.ms-pki.stl', 'stl'),
(371, 'Microsoft Trust UI Provider - Security Catalog', 'application/vnd.ms-pki.seccat', 'cat'),
(372, 'Microsoft Visio', 'application/vnd.visio', 'vsd'),
(373, 'Microsoft Visio 2013', 'application/vnd.visio2013', 'vsdx'),
(374, 'Microsoft Windows Media', 'video/x-ms-wm', 'wm'),
(375, 'Microsoft Windows Media Audio', 'audio/x-ms-wma', 'wma'),
(376, 'Microsoft Windows Media Audio Redirector', 'audio/x-ms-wax', 'wax'),
(377, 'Microsoft Windows Media Audio/Video Playlist', 'video/x-ms-wmx', 'wmx'),
(378, 'Microsoft Windows Media Player Download Package', 'application/x-ms-wmd', 'wmd'),
(379, 'Microsoft Windows Media Player Playlist', 'application/vnd.ms-wpl', 'wpl'),
(380, 'Microsoft Windows Media Player Skin Package', 'application/x-ms-wmz', 'wmz'),
(381, 'Microsoft Windows Media Video', 'video/x-ms-wmv', 'wmv'),
(382, 'Microsoft Windows Media Video Playlist', 'video/x-ms-wvx', 'wvx'),
(383, 'Microsoft Windows Metafile', 'application/x-msmetafile', 'wmf'),
(384, 'Microsoft Windows Terminal Services', 'application/x-msterminal', 'trm'),
(385, 'Microsoft Word', 'application/msword', 'doc'),
(386, 'Microsoft Word - Macro-Enabled Document', 'application/vnd.ms-word.document.macroenabled.12', 'docm'),
(387, 'Microsoft Word - Macro-Enabled Template', 'application/vnd.ms-word.template.macroenabled.12', 'dotm'),
(388, 'Microsoft Wordpad', 'application/x-mswrite', 'wri'),
(389, 'Microsoft Works', 'application/vnd.ms-works', 'wps'),
(390, 'Microsoft XAML Browser Application', 'application/x-ms-xbap', 'xbap'),
(391, 'Microsoft XML Paper Specification', 'application/vnd.ms-xpsdocument', 'xps'),
(392, 'MIDI - Musical Instrument Digital Interface', 'audio/midi', 'mid'),
(393, 'MiniPay', 'application/vnd.ibm.minipay', 'mpy'),
(394, 'MO:DCA-P', 'application/vnd.ibm.modcap', 'afp'),
(395, 'Mobile Information Device Profile', 'application/vnd.jcp.javame.midlet-rms', 'rms'),
(396, 'MobileTV', 'application/vnd.tmobile-livetv', 'tmo'),
(397, 'Mobipocket', 'application/x-mobipocket-ebook', 'prc'),
(398, 'Mobius Management Systems - Basket file', 'application/vnd.mobius.mbk', 'mbk'),
(399, 'Mobius Management Systems - Distribution Database', 'application/vnd.mobius.dis', 'dis'),
(400, 'Mobius Management Systems - Policy Definition Language File', 'application/vnd.mobius.plc', 'plc'),
(401, 'Mobius Management Systems - Query File', 'application/vnd.mobius.mqy', 'mqy'),
(402, 'Mobius Management Systems - Script Language', 'application/vnd.mobius.msl', 'msl'),
(403, 'Mobius Management Systems - Topic Index File', 'application/vnd.mobius.txf', 'txf'),
(404, 'Mobius Management Systems - UniversalArchive', 'application/vnd.mobius.daf', 'daf'),
(405, 'mod_fly / fly.cgi', 'text/vnd.fly', 'fly'),
(406, 'Mophun Certificate', 'application/vnd.mophun.certificate', 'mpc'),
(407, 'Mophun VM', 'application/vnd.mophun.application', 'mpn'),
(408, 'Motion JPEG 2000', 'video/mj2', 'mj2'),
(409, 'MPEG Audio', 'audio/mpeg', 'mpga'),
(410, 'MPEG Url', 'video/vnd.mpegurl', 'mxu'),
(411, 'MPEG Video', 'video/mpeg', 'mpeg'),
(412, 'MPEG-21', 'application/mp21', 'm21'),
(413, 'MPEG-4 Audio', 'audio/mp4', 'mp4a'),
(414, 'MPEG-4 Video', 'video/mp4', 'mp4'),
(415, 'MPEG4', 'application/mp4', 'mp4'),
(416, 'Multimedia Playlist Unicode', 'application/vnd.apple.mpegurl', 'm3u8'),
(417, 'MUsical Score Interpreted Code Invented for the ASCII designation of Notation', 'application/vnd.musician', 'mus'),
(418, 'Muvee Automatic Video Editing', 'application/vnd.muvee.style', 'msty'),
(419, 'MXML', 'application/xv+xml', 'mxml'),
(420, 'N-Gage Game Data', 'application/vnd.nokia.n-gage.data', 'ngdat'),
(421, 'N-Gage Game Installer', 'application/vnd.nokia.n-gage.symbian.install', 'n-gage'),
(422, 'Navigation Control file for XML (for ePub)', 'application/x-dtbncx+xml', 'ncx'),
(423, 'Network Common Data Form (NetCDF)', 'application/x-netcdf', 'nc'),
(424, 'neuroLanguage', 'application/vnd.neurolanguage.nlu', 'nlu'),
(425, 'New Moon Liftoff/DNA', 'application/vnd.dna', 'dna'),
(426, 'NobleNet Directory', 'application/vnd.noblenet-directory', 'nnd'),
(427, 'NobleNet Sealer', 'application/vnd.noblenet-sealer', 'nns'),
(428, 'NobleNet Web', 'application/vnd.noblenet-web', 'nnw'),
(429, 'Nokia Radio Application - Preset', 'application/vnd.nokia.radio-preset', 'rpst'),
(430, 'Nokia Radio Application - Preset', 'application/vnd.nokia.radio-presets', 'rpss'),
(431, 'Notation3', 'text/n3', 'n3'),
(432, 'NpGraphIt', 'application/vnd.flographit', 'gph'),
(433, 'Nuera ECELP 4800', 'audio/vnd.nuera.ecelp4800', 'ecelp4800'),
(434, 'Nuera ECELP 7470', 'audio/vnd.nuera.ecelp7470', 'ecelp7470'),
(435, 'Nuera ECELP 9600', 'audio/vnd.nuera.ecelp9600', 'ecelp9600'),
(436, 'Office Document Architecture', 'application/oda', 'oda'),
(437, 'Ogg', 'application/ogg', 'ogx'),
(438, 'Ogg Audio', 'audio/ogg', 'oga'),
(439, 'Ogg Video', 'video/ogg', 'ogv'),
(440, 'OMA Download Agents', 'application/vnd.oma.dd2+xml', 'dd2'),
(441, 'Open Document Text Web', 'application/vnd.oasis.opendocument.text-web', 'oth'),
(442, 'Open eBook Publication Structure', 'application/oebps-package+xml', 'opf'),
(443, 'Open Financial Exchange', 'application/vnd.intu.qbo', 'qbo'),
(444, 'Open Office Extension', 'application/vnd.openofficeorg.extension', 'oxt'),
(445, 'Open Score Format', 'application/vnd.yamaha.openscoreformat', 'osf'),
(446, 'Open Web Media Project - Audio', 'audio/webm', 'weba'),
(447, 'Open Web Media Project - Video', 'video/webm', 'webm'),
(448, 'OpenDocument Chart', 'application/vnd.oasis.opendocument.chart', 'odc'),
(449, 'OpenDocument Chart Template', 'application/vnd.oasis.opendocument.chart-template', 'otc'),
(450, 'OpenDocument Database', 'application/vnd.oasis.opendocument.database', 'odb'),
(451, 'OpenDocument Formula', 'application/vnd.oasis.opendocument.formula', 'odf'),
(452, 'OpenDocument Formula Template', 'application/vnd.oasis.opendocument.formula-template', 'odft'),
(453, 'OpenDocument Graphics', 'application/vnd.oasis.opendocument.graphics', 'odg'),
(454, 'OpenDocument Graphics Template', 'application/vnd.oasis.opendocument.graphics-template', 'otg'),
(455, 'OpenDocument Image', 'application/vnd.oasis.opendocument.image', 'odi'),
(456, 'OpenDocument Image Template', 'application/vnd.oasis.opendocument.image-template', 'oti'),
(457, 'OpenDocument Presentation', 'application/vnd.oasis.opendocument.presentation', 'odp'),
(458, 'OpenDocument Presentation Template', 'application/vnd.oasis.opendocument.presentation-template', 'otp'),
(459, 'OpenDocument Spreadsheet', 'application/vnd.oasis.opendocument.spreadsheet', 'ods'),
(460, 'OpenDocument Spreadsheet Template', 'application/vnd.oasis.opendocument.spreadsheet-template', 'ots'),
(461, 'OpenDocument Text', 'application/vnd.oasis.opendocument.text', 'odt'),
(462, 'OpenDocument Text Master', 'application/vnd.oasis.opendocument.text-master', 'odm'),
(463, 'OpenDocument Text Template', 'application/vnd.oasis.opendocument.text-template', 'ott'),
(464, 'OpenGL Textures (KTX)', 'image/ktx', 'ktx'),
(465, 'OpenOffice - Calc (Spreadsheet)', 'application/vnd.sun.xml.calc', 'sxc'),
(466, 'OpenOffice - Calc Template (Spreadsheet)', 'application/vnd.sun.xml.calc.template', 'stc'),
(467, 'OpenOffice - Draw (Graphics)', 'application/vnd.sun.xml.draw', 'sxd'),
(468, 'OpenOffice - Draw Template (Graphics)', 'application/vnd.sun.xml.draw.template', 'std'),
(469, 'OpenOffice - Impress (Presentation)', 'application/vnd.sun.xml.impress', 'sxi'),
(470, 'OpenOffice - Impress Template (Presentation)', 'application/vnd.sun.xml.impress.template', 'sti'),
(471, 'OpenOffice - Math (Formula)', 'application/vnd.sun.xml.math', 'sxm'),
(472, 'OpenOffice - Writer (Text - HTML)', 'application/vnd.sun.xml.writer', 'sxw'),
(473, 'OpenOffice - Writer (Text - HTML)', 'application/vnd.sun.xml.writer.global', 'sxg'),
(474, 'OpenOffice - Writer Template (Text - HTML)', 'application/vnd.sun.xml.writer.template', 'stw'),
(475, 'OpenType Font File', 'application/x-font-otf', 'otf'),
(476, 'OSFPVG', 'application/vnd.yamaha.openscoreformat.osfpvg+xml', 'osfpvg'),
(477, 'OSGi Deployment Package', 'application/vnd.osgi.dp', 'dp'),
(478, 'PalmOS Data', 'application/vnd.palm', 'pdb'),
(479, 'Pascal Source File', 'text/x-pascal', 'p'),
(480, 'PawaaFILE', 'application/vnd.pawaafile', 'paw'),
(481, 'PCL 6 Enhanced (Formely PCL XL)', 'application/vnd.hp-pclxl', 'pclxl'),
(482, 'Pcsel eFIF File', 'application/vnd.picsel', 'efif'),
(483, 'PCX Image', 'image/x-pcx', 'pcx'),
(484, 'Photoshop Document', 'image/vnd.adobe.photoshop', 'psd'),
(485, 'PICSRules', 'application/pics-rules', 'prf'),
(486, 'PICT Image', 'image/x-pict', 'pic'),
(487, 'pIRCh', 'application/x-chat', 'chat'),
(488, 'PKCS #10 - Certification Request Standard', 'application/pkcs10', 'p10'),
(489, 'PKCS #12 - Personal Information Exchange Syntax Standard', 'application/x-pkcs12', 'p12'),
(490, 'PKCS #7 - Cryptographic Message Syntax Standard', 'application/pkcs7-mime', 'p7m'),
(491, 'PKCS #7 - Cryptographic Message Syntax Standard', 'application/pkcs7-signature', 'p7s'),
(492, 'PKCS #7 - Cryptographic Message Syntax Standard (Certificate Request Response)', 'application/x-pkcs7-certreqresp', 'p7r'),
(493, 'PKCS #7 - Cryptographic Message Syntax Standard (Certificates)', 'application/x-pkcs7-certificates', 'p7b'),
(494, 'PKCS #8 - Private-Key Information Syntax Standard', 'application/pkcs8', 'p8'),
(495, 'PocketLearn Viewers', 'application/vnd.pocketlearn', 'plf'),
(496, 'Portable Anymap Image', 'image/x-portable-anymap', 'pnm'),
(497, 'Portable Bitmap Format', 'image/x-portable-bitmap', 'pbm'),
(498, 'Portable Compiled Format', 'application/x-font-pcf', 'pcf'),
(499, 'Portable Font Resource', 'application/font-tdpfr', 'pfr'),
(500, 'Portable Game Notation (Chess Games)', 'application/x-chess-pgn', 'pgn'),
(501, 'Portable Graymap Format', 'image/x-portable-graymap', 'pgm'),
(502, 'Portable Network Graphics (PNG)', 'image/png', 'png'),
(503, 'Portable Network Graphics (PNG) (Citrix client)', 'image/x-citrix-png', 'png'),
(504, 'Portable Network Graphics (PNG) (x-token)', 'image/x-png', 'png'),
(505, 'Portable Pixmap Format', 'image/x-portable-pixmap', 'ppm'),
(506, 'Portable Symmetric Key Container', 'application/pskc+xml', 'pskcxml'),
(507, 'PosML', 'application/vnd.ctc-posml', 'pml'),
(508, 'PostScript', 'application/postscript', 'ai'),
(509, 'PostScript Fonts', 'application/x-font-type1', 'pfa'),
(510, 'PowerBuilder', 'application/vnd.powerbuilder6', 'pbd'),
(511, 'Pretty Good Privacy', 'application/pgp-encrypted', 'pgp'),
(512, 'Pretty Good Privacy - Signature', 'application/pgp-signature', 'pgp'),
(513, 'Preview Systems ZipLock/VBox', 'application/vnd.previewsystems.box', 'box'),
(514, 'Princeton Video Image', 'application/vnd.pvi.ptid1', 'ptid'),
(515, 'Pronunciation Lexicon Specification', 'application/pls+xml', 'pls'),
(516, 'Proprietary P&G Standard Reporting System', 'application/vnd.pg.format', 'str'),
(517, 'Proprietary P&G Standard Reporting System', 'application/vnd.pg.osasli', 'ei6'),
(518, 'PRS Lines Tag', 'text/prs.lines.tag', 'dsc'),
(519, 'PSF Fonts', 'application/x-font-linux-psf', 'psf'),
(520, 'PubliShare Objects', 'application/vnd.publishare-delta-tree', 'qps'),
(521, 'QuarkXpress', 'application/vnd.quark.quarkxpress', 'qxd'),
(522, 'QUASS Stream Player', 'application/vnd.epson.esf', 'esf'),
(523, 'QUASS Stream Player', 'application/vnd.epson.msf', 'msf'),
(524, 'QUASS Stream Player', 'application/vnd.epson.ssf', 'ssf'),
(525, 'QuickAnime Player', 'application/vnd.epson.quickanime', 'qam'),
(526, 'Quicken', 'application/vnd.intu.qfx', 'qfx'),
(527, 'Quicktime Video', 'video/quicktime', 'qt'),
(528, 'RAR Archive', 'application/x-rar-compressed', 'rar'),
(529, 'Real Audio Sound', 'audio/x-pn-realaudio', 'ram'),
(530, 'Real Audio Sound', 'audio/x-pn-realaudio-plugin', 'rmp'),
(531, 'Really Simple Discovery', 'application/rsd+xml', 'rsd'),
(532, 'RealMedia', 'application/vnd.rn-realmedia', 'rm'),
(533, 'RealVNC', 'application/vnd.realvnc.bed', 'bed'),
(534, 'Recordare Applications', 'application/vnd.recordare.musicxml', 'mxl'),
(535, 'Recordare Applications', 'application/vnd.recordare.musicxml+xml', 'musicxml'),
(536, 'Relax NG Compact Syntax', 'application/relax-ng-compact-syntax', 'rnc'),
(537, 'RemoteDocs R-Viewer', 'application/vnd.data-vision.rdz', 'rdz'),
(538, 'Resource Description Framework', 'application/rdf+xml', 'rdf'),
(539, 'RetroPlatform Player', 'application/vnd.cloanto.rp9', 'rp9'),
(540, 'RhymBox', 'application/vnd.jisp', 'jisp'),
(541, 'Rich Text Format', 'application/rtf', 'rtf'),
(542, 'Rich Text Format (RTF)', 'text/richtext', 'rtx'),
(543, 'ROUTE 66 Location Based Services', 'application/vnd.route66.link66+xml', 'link66'),
(544, 'RSS - Really Simple Syndication', 'application/rss+xml', 'xml'),
(545, 'RSS - Really Simple Syndication', 'application/rss+xml', 'xml'),
(546, 'S Hexdump Format', 'application/shf+xml', 'shf'),
(547, 'SailingTracker', 'application/vnd.sailingtracker.track', 'st'),
(548, 'Scalable Vector Graphics (SVG)', 'image/svg+xml', 'svg'),
(549, 'ScheduleUs', 'application/vnd.sus-calendar', 'sus'),
(550, 'Search/Retrieve via URL Response Format', 'application/sru+xml', 'sru'),
(551, 'Secure Electronic Transaction - Payment', 'application/set-payment-initiation', 'setpay'),
(552, 'Secure Electronic Transaction - Registration', 'application/set-registration-initiation', 'setreg'),
(553, 'Secured eMail', 'application/vnd.sema', 'sema'),
(554, 'Secured eMail', 'application/vnd.semd', 'semd'),
(555, 'Secured eMail', 'application/vnd.semf', 'semf'),
(556, 'SeeMail', 'application/vnd.seemail', 'see'),
(557, 'Server Normal Format', 'application/x-font-snf', 'snf'),
(558, 'Server-Based Certificate Validation Protocol - Validation Policies - Request', 'application/scvp-vp-request', 'spq'),
(559, 'Server-Based Certificate Validation Protocol - Validation Policies - Response', 'application/scvp-vp-response', 'spp'),
(560, 'Server-Based Certificate Validation Protocol - Validation Request', 'application/scvp-cv-request', 'scq'),
(561, 'Server-Based Certificate Validation Protocol - Validation Response', 'application/scvp-cv-response', 'scs'),
(562, 'Session Description Protocol', 'application/sdp', 'sdp'),
(563, 'Setext', 'text/x-setext', 'etx'),
(564, 'SGI Movie', 'video/x-sgi-movie', 'movie'),
(565, 'Shana Informed Filler', 'application/vnd.shana.informed.formdata', 'ifm'),
(566, 'Shana Informed Filler', 'application/vnd.shana.informed.formtemplate', 'itp'),
(567, 'Shana Informed Filler', 'application/vnd.shana.informed.interchange', 'iif'),
(568, 'Shana Informed Filler', 'application/vnd.shana.informed.package', 'ipk'),
(569, 'Sharing Transaction Fraud Data', 'application/thraud+xml', 'tfi'),
(570, 'Shell Archive', 'application/x-shar', 'shar'),
(571, 'Silicon Graphics RGB Bitmap', 'image/x-rgb', 'rgb'),
(572, 'SimpleAnimeLite Player', 'application/vnd.epson.salt', 'slt'),
(573, 'Simply Accounting', 'application/vnd.accpac.simply.aso', 'aso'),
(574, 'Simply Accounting - Data Import', 'application/vnd.accpac.simply.imp', 'imp'),
(575, 'SimTech MindMapper', 'application/vnd.simtech-mindmapper', 'twd'),
(576, 'Sixth Floor Media - CommonSpace', 'application/vnd.commonspace', 'csp'),
(577, 'SMAF Audio', 'application/vnd.yamaha.smaf-audio', 'saf'),
(578, 'SMAF File', 'application/vnd.smaf', 'mmf'),
(579, 'SMAF Phrase', 'application/vnd.yamaha.smaf-phrase', 'spf'),
(580, 'SMART Technologies Apps', 'application/vnd.smart.teacher', 'teacher'),
(581, 'SourceView Document', 'application/vnd.svd', 'svd'),
(582, 'SPARQL - Query', 'application/sparql-query', 'rq'),
(583, 'SPARQL - Results', 'application/sparql-results+xml', 'srx'),
(584, 'Speech Recognition Grammar Specification', 'application/srgs', 'gram'),
(585, 'Speech Recognition Grammar Specification - XML', 'application/srgs+xml', 'grxml'),
(586, 'Speech Synthesis Markup Language', 'application/ssml+xml', 'ssml'),
(587, 'SSEYO Koan Play File', 'application/vnd.koan', 'skp'),
(588, 'Standard Generalized Markup Language (SGML)', 'text/sgml', 'sgml'),
(589, 'StarOffice - Calc', 'application/vnd.stardivision.calc', 'sdc'),
(590, 'StarOffice - Draw', 'application/vnd.stardivision.draw', 'sda'),
(591, 'StarOffice - Impress', 'application/vnd.stardivision.impress', 'sdd'),
(592, 'StarOffice - Math', 'application/vnd.stardivision.math', 'smf'),
(593, 'StarOffice - Writer', 'application/vnd.stardivision.writer', 'sdw'),
(594, 'StarOffice - Writer (Global)', 'application/vnd.stardivision.writer-global', 'sgl'),
(595, 'StepMania', 'application/vnd.stepmania.stepchart', 'sm'),
(596, 'Stuffit Archive', 'application/x-stuffit', 'sit'),
(597, 'Stuffit Archive', 'application/x-stuffitx', 'sitx'),
(598, 'SudokuMagic', 'application/vnd.solent.sdkm+xml', 'sdkm'),
(599, 'Sugar Linux Application Bundle', 'application/vnd.olpc-sugar', 'xo'),
(600, 'Sun Audio - Au file format', 'audio/basic', 'au'),
(601, 'SundaHus WQ', 'application/vnd.wqd', 'wqd'),
(602, 'Symbian Install Package', 'application/vnd.symbian.install', 'sis'),
(603, 'Synchronized Multimedia Integration Language', 'application/smil+xml', 'smi'),
(604, 'SyncML', 'application/vnd.syncml+xml', 'xsm'),
(605, 'SyncML - Device Management', 'application/vnd.syncml.dm+wbxml', 'bdm'),
(606, 'SyncML - Device Management', 'application/vnd.syncml.dm+xml', 'xdm'),
(607, 'System V Release 4 CPIO Archive', 'application/x-sv4cpio', 'sv4cpio'),
(608, 'System V Release 4 CPIO Checksum Data', 'application/x-sv4crc', 'sv4crc'),
(609, 'Systems Biology Markup Language', 'application/sbml+xml', 'sbml'),
(610, 'Tab Seperated Values', 'text/tab-separated-values', 'tsv'),
(611, 'Tagged Image File Format', 'image/tiff', 'tiff'),
(612, 'Tao Intent', 'application/vnd.tao.intent-module-archive', 'tao'),
(613, 'Tar File (Tape Archive)', 'application/x-tar', 'tar'),
(614, 'Tcl Script', 'application/x-tcl', 'tcl'),
(615, 'TeX', 'application/x-tex', 'tex'),
(616, 'TeX Font Metric', 'application/x-tex-tfm', 'tfm'),
(617, 'Text Encoding and Interchange', 'application/tei+xml', 'tei'),
(618, 'Text File', 'text/plain', 'txt'),
(619, 'TIBCO Spotfire', 'application/vnd.spotfire.dxp', 'dxp'),
(620, 'TIBCO Spotfire', 'application/vnd.spotfire.sfs', 'sfs'),
(621, 'Time Stamped Data Envelope', 'application/timestamped-data', 'tsd'),
(622, 'TRI Systems Config', 'application/vnd.trid.tpt', 'tpt'),
(623, 'Triscape Map Explorer', 'application/vnd.triscape.mxs', 'mxs'),
(624, 'troff', 'text/troff', 't'),
(625, 'True BASIC', 'application/vnd.trueapp', 'tra'),
(626, 'TrueType Font', 'application/x-font-ttf', 'ttf'),
(627, 'Turtle (Terse RDF Triple Language)', 'text/turtle', 'ttl'),
(628, 'UMAJIN', 'application/vnd.umajin', 'umj'),
(629, 'Unique Object Markup Language', 'application/vnd.uoml+xml', 'uoml'),
(630, 'Unity 3d', 'application/vnd.unity', 'unityweb'),
(631, 'Universal Forms Description Language', 'application/vnd.ufdl', 'ufd'),
(632, 'URI Resolution Services', 'text/uri-list', 'uri'),
(633, 'User Interface Quartz - Theme (Symbian)', 'application/vnd.uiq.theme', 'utz'),
(634, 'Ustar (Uniform Standard Tape Archive)', 'application/x-ustar', 'ustar'),
(635, 'UUEncode', 'text/x-uuencode', 'uu'),
(636, 'vCalendar', 'text/x-vcalendar', 'vcs'),
(637, 'vCard', 'text/x-vcard', 'vcf'),
(638, 'Video CD', 'application/x-cdlink', 'vcd'),
(639, 'Viewport+', 'application/vnd.vsf', 'vsf'),
(640, 'Virtual Reality Modeling Language', 'model/vrml', 'wrl'),
(641, 'VirtualCatalog', 'application/vnd.vcx', 'vcx'),
(642, 'Virtue MTS', 'model/vnd.mts', 'mts'),
(643, 'Virtue VTU', 'model/vnd.vtu', 'vtu'),
(644, 'Visionary', 'application/vnd.visionary', 'vis'),
(645, 'Vivo', 'video/vnd.vivo', 'viv'),
(646, 'Voice Browser Call Control', 'application/ccxml+xml,', 'ccxml'),
(647, 'VoiceXML', 'application/voicexml+xml', 'vxml'),
(648, 'WAIS Source', 'application/x-wais-source', 'src'),
(649, 'WAP Binary XML (WBXML)', 'application/vnd.wap.wbxml', 'wbxml'),
(650, 'WAP Bitamp (WBMP)', 'image/vnd.wap.wbmp', 'wbmp'),
(651, 'Waveform Audio File Format (WAV)', 'audio/x-wav', 'wav'),
(652, 'Web Distributed Authoring and Versioning', 'application/davmount+xml', 'davmount'),
(653, 'Web Open Font Format', 'application/x-font-woff', 'woff'),
(654, 'Web Services Policy', 'application/wspolicy+xml', 'wspolicy'),
(655, 'WebP Image', 'image/webp', 'webp'),
(656, 'WebTurbo', 'application/vnd.webturbo', 'wtb'),
(657, 'Widget Packaging and XML Configuration', 'application/widget', 'wgt'),
(658, 'WinHelp', 'application/winhlp', 'hlp'),
(659, 'Wireless Markup Language (WML)', 'text/vnd.wap.wml', 'wml'),
(660, 'Wireless Markup Language Script (WMLScript)', 'text/vnd.wap.wmlscript', 'wmls'),
(661, 'WMLScript', 'application/vnd.wap.wmlscriptc', 'wmlsc'),
(662, 'Wordperfect', 'application/vnd.wordperfect', 'wpd'),
(663, 'Worldtalk', 'application/vnd.wt.stf', 'stf'),
(664, 'WSDL - Web Services Description Language', 'application/wsdl+xml', 'wsdl'),
(665, 'X BitMap', 'image/x-xbitmap', 'xbm'),
(666, 'X PixMap', 'image/x-xpixmap', 'xpm'),
(667, 'X Window Dump', 'image/x-xwindowdump', 'xwd'),
(668, 'X.509 Certificate', 'application/x-x509-ca-cert', 'der'),
(669, 'Xfig', 'application/x-xfig', 'fig'),
(670, 'XHTML - The Extensible HyperText Markup Language', 'application/xhtml+xml', 'xhtml'),
(671, 'XML - Extensible Markup Language', 'application/xml', 'xml'),
(672, 'XML Configuration Access Protocol - XCAP Diff', 'application/xcap-diff+xml', 'xdf'),
(673, 'XML Encryption Syntax and Processing', 'application/xenc+xml', 'xenc'),
(674, 'XML Patch Framework', 'application/patch-ops-error+xml', 'xer'),
(675, 'XML Resource Lists', 'application/resource-lists+xml', 'rl'),
(676, 'XML Resource Lists', 'application/rls-services+xml', 'rs'),
(677, 'XML Resource Lists Diff', 'application/resource-lists-diff+xml', 'rld'),
(678, 'XML Transformations', 'application/xslt+xml', 'xslt'),
(679, 'XML-Binary Optimized Packaging', 'application/xop+xml', 'xop'),
(680, 'XPInstall - Mozilla', 'application/x-xpinstall', 'xpi'),
(681, 'XSPF - XML Shareable Playlist Format', 'application/xspf+xml', 'xspf'),
(682, 'XUL - XML User Interface Language', 'application/vnd.mozilla.xul+xml', 'xul'),
(683, 'XYZ File Format', 'chemical/x-xyz', 'xyz'),
(684, 'YANG Data Modeling Language', 'application/yang', 'yang'),
(685, 'YIN (YANG - XML)', 'application/yin+xml', 'yin'),
(686, 'Z.U.L. Geometry', 'application/vnd.zul', 'zir'),
(687, 'Zip Archive', 'application/zip', 'zip'),
(688, 'ZVUE Media Manager', 'application/vnd.handheld-entertainment+xml', 'zmm'),
(689, 'Zzazz Deck', 'application/vnd.zzazz.deck+xml', 'zaz');

-- --------------------------------------------------------

--
-- Table structure for table `pb_media-types`
--

CREATE TABLE `pb_media-types` (
  `id` int(11) NOT NULL,
  `type` varchar(1024) NOT NULL,
  `extensions` varchar(8192) NOT NULL,
  `max-size` varchar(128) DEFAULT '2M'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_media-types`
--

INSERT INTO `pb_media-types` (`id`, `type`, `extensions`, `max-size`) VALUES
(1, 'profilepicture', 'jpg,jpeg,png,gif', '2M');

-- --------------------------------------------------------

--
-- Table structure for table `pb_object-properties`
--

CREATE TABLE `pb_object-properties` (
  `id` int(11) NOT NULL,
  `object` int(11) NOT NULL,
  `property` varchar(256) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_object-properties`
--

INSERT INTO `pb_object-properties` (`id`, `object`, `property`, `value`) VALUES
(1, 1, 'enabled', '0'),
(4, 2, 'NONE', 'score=0'),
(5, 2, 'WEAK', 'score=0.6,length'),
(6, 2, 'MEDIUM', 'score=0.8,uppercase,lowercase,length'),
(7, 2, 'STRONG', 'score=1');

-- --------------------------------------------------------

--
-- Table structure for table `pb_objects`
--

CREATE TABLE `pb_objects` (
  `id` int(11) NOT NULL,
  `type` varchar(1024) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_objects`
--

INSERT INTO `pb_objects` (`id`, `type`, `name`, `created`, `updated`) VALUES
(1, 'module-config', 'PbMaintenance', '2021-07-13 14:16:25', '2021-07-13 14:16:25'),
(2, 'pb-password', 'policies', '2021-07-13 14:16:25', '2021-07-13 14:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `pb_permissions`
--

CREATE TABLE `pb_permissions` (
  `id` int(11) NOT NULL,
  `permission` longtext NOT NULL,
  `target` varchar(64) NOT NULL,
  `granted` int(11) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_permissions`
--

INSERT INTO `pb_permissions` (`id`, `permission`, `target`, `granted`, `created`, `updated`) VALUES
(1, 'site.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(2, 'media.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(3, 'object.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(4, 'policy.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(5, 'relation.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(6, 'role.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(7, 'session.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(8, 'token.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(9, 'user.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30'),
(10, 'router.*', 'grp:1', 1, '2021-07-13 14:33:30', '2021-07-13 14:33:30');

-- --------------------------------------------------------

--
-- Table structure for table `pb_policies`
--

CREATE TABLE `pb_policies` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_policies`
--

INSERT INTO `pb_policies` (`id`, `name`, `value`, `created`, `updated`) VALUES
(1, 'site-title', 'Micha de Vries', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(2, 'site-description', 'A professional webdeveloper', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(7, 'site-location', 'http://portfolio.local', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(8, 'site-indexing', '1', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(9, 'usernames-enabled', '1', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(10, 'usernames-required', '0', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(11, 'signup-allowed', '0', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(14, 'password-policy', 'STRONG', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(15, 'profilepicture-allowed', '1', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(16, 'password-reset-policy', 'REQUESTADMIN', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(17, 'user-email-verification', '0', '2021-07-13 14:34:04', '2021-07-13 14:34:04'),
(19, 'allow-stay-signedin', '1', '2021-07-13 14:34:04', '2021-07-13 14:34:04');

-- --------------------------------------------------------

--
-- Table structure for table `pb_relations`
--

CREATE TABLE `pb_relations` (
  `id` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `origin` int(11) NOT NULL,
  `target` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_roles`
--

CREATE TABLE `pb_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `weight` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_roles`
--

INSERT INTO `pb_roles` (`id`, `name`, `description`, `weight`, `created`, `updated`) VALUES
(1, 'Administrator', 'An administrator can manage and control every aspect of the website.', 1, '2021-07-13 14:39:24', '2021-07-13 14:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `pb_sessions`
--

CREATE TABLE `pb_sessions` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `lastSeen` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration` int(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_token-secrets`
--

CREATE TABLE `pb_token-secrets` (
  `id` int(11) NOT NULL,
  `type` varchar(1024) NOT NULL,
  `secret` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_usermeta`
--

CREATE TABLE `pb_usermeta` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_users`
--

CREATE TABLE `pb_users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(1024) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL DEFAULT 'UNVERIFIED',
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pb_virtual-paths`
--

CREATE TABLE `pb_virtual-paths` (
  `id` int(11) NOT NULL,
  `path` varchar(512) NOT NULL,
  `target` varchar(1024) NOT NULL,
  `lang` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pb_virtual-paths`
--

INSERT INTO `pb_virtual-paths` (`id`, `path`, `target`, `lang`) VALUES
(1, '/', '', 'en');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pb_media`
--
ALTER TABLE `pb_media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `pb_media-extensions`
--
ALTER TABLE `pb_media-extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_media-types`
--
ALTER TABLE `pb_media-types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`) USING HASH;

--
-- Indexes for table `pb_object-properties`
--
ALTER TABLE `pb_object-properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_objects`
--
ALTER TABLE `pb_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_permissions`
--
ALTER TABLE `pb_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_policies`
--
ALTER TABLE `pb_policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `pb_relations`
--
ALTER TABLE `pb_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_roles`
--
ALTER TABLE `pb_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `weight` (`weight`);

--
-- Indexes for table `pb_sessions`
--
ALTER TABLE `pb_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `pb_token-secrets`
--
ALTER TABLE `pb_token-secrets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`) USING HASH;

--
-- Indexes for table `pb_usermeta`
--
ALTER TABLE `pb_usermeta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pb_users`
--
ALTER TABLE `pb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`) USING HASH;

--
-- Indexes for table `pb_virtual-paths`
--
ALTER TABLE `pb_virtual-paths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pb_media`
--
ALTER TABLE `pb_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_media-extensions`
--
ALTER TABLE `pb_media-extensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=690;

--
-- AUTO_INCREMENT for table `pb_media-types`
--
ALTER TABLE `pb_media-types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pb_object-properties`
--
ALTER TABLE `pb_object-properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pb_objects`
--
ALTER TABLE `pb_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pb_permissions`
--
ALTER TABLE `pb_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pb_policies`
--
ALTER TABLE `pb_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pb_relations`
--
ALTER TABLE `pb_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_roles`
--
ALTER TABLE `pb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pb_sessions`
--
ALTER TABLE `pb_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_token-secrets`
--
ALTER TABLE `pb_token-secrets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_usermeta`
--
ALTER TABLE `pb_usermeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_users`
--
ALTER TABLE `pb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pb_virtual-paths`
--
ALTER TABLE `pb_virtual-paths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
