unit LandTaxEDeclarationData;

interface

uses IntListU, landtaxClassesU, XmlSimpleXml, EDeclarationU;

type TDeclaration=class;

     TMonthTotals=array[1..12] of currency;

     TInnerLandTaxObject=class
     private
       mID:integer;
       mDept:integer;
       mImns:int64;
       mImnsName:string;
       mMtrfScode:string;
       mKind:integer;
       mNumber:string;
       mOblast:int64;
       mRaion:int64;
       mGorod:int64;
       mActs:string;
       mDesc:string;
       mAddress:string;
       mCategory:int64;
       mCategName:string;
       mFuncKind:integer;
       mFKindName:string;
       mArea:currency;
       mTermBegin:TDate;
       mTermEnd:TDate;
       mRecTermIndex:integer;
       mLeaseTotal:currency;
       mCadastrRateVal:currency;
       mCadastrRate:currency;
       mCadastrTotal:currency;
       mFuncRate:currency;
       mTaxRateUnit:currency;
       mTaxRate:currency;
       mTermKoef:currency;
       mKoefLocal:currency;
       mTaxTotal:currency;
       mFreeArea:currency;
       mFreeCadastrTotal:currency;
       mFreeTaxRate:currency;
       mFreeTermBegin:TDate;
       mFreeTermEnd:TDate;
       mFreeTermKoef:currency;
       mFreeTotal:currency;
       mTotalToPay:currency;
       mRecpay1ToPay:currency;
       mRecpay1Payed:currency;
       mRecpay3ToPay:currency;
       mRecpay3Payed:currency;
       mRecpay5ToPay:currency;
       mRecpay5Payed:currency;
       mRecpay8ToPay:currency;
       mRecpay8Payed:currency;
       mRecpay9ToPay:currency;
       mRecpay9Payed:currency;

       mAllFields:TNameValueList;

       mMonthTotals:TMonthTotals;

       function GetIntNumber:integer;
     protected
     public
       constructor Create;
       destructor Destroy;override;
       property ID:integer read mID write mID;
       property Dept:integer read mDept write mDept;
       property Imns:int64 read mImns write mImns;
       property ImnsName:string read mImnsName write mImnsName;
       property MtrfScode:string read mMtrfScode write mMtrfScode;
       property Kind:integer read mKind write mKind;
       property Number:string read mNumber write mNumber;
       property IntNumber:integer read GetIntNumber;


       property Oblast:int64 read mOblast write mOblast;
       property Raion:int64 read mRaion write mRaion;
       property Gorod:int64 read mGorod write mGorod;
       property Acts:string read mActs write mActs;
       property Desc:string read mDesc write mDesc;
       property Address:string read mAddress write mAddress;
       property Category:int64 read mCategory write mCategory;
       property CategName:string read mCategName write mCategName;
       property FuncKind:integer read mFuncKind write mFuncKind;
       property FKindName:string read mFKindName write mFKindName;
       property Area:currency read mArea write mArea;
       property TermBegin:TDate read mTermBegin write mTermBegin;
       property TermEnd:TDate read mTermEnd write mTermEnd;
       property RecTermIndex:integer read mRecTermIndex write mRecTermIndex;
       property LeaseTotal:currency read mLeaseTotal write mLeaseTotal;
       property CadastrRateVal:currency read mCadastrRateVal write mCadastrRateVal;
       property CadastrRate:currency read mCadastrRate write mCadastrRate;
       property CadastrTotal:currency read mCadastrTotal write mCadastrTotal;
       property FuncRate:currency read mFuncRate write mFuncRate;
       property TaxRateUnit:currency read mTaxRateUnit write mTaxRateUnit;
       property TaxRate:currency read mTaxRate write mTaxRate;
       property TermKoef:currency read mTermKoef write mTermKoef;
       property KoefLocal:currency read mKoefLocal write mKoefLocal;
       property TaxTotal:currency read mTaxTotal write mTaxTotal;
       property FreeArea:currency read mFreeArea write mFreeArea;
       property FreeCadastrTotal:currency read mFreeCadastrTotal write mFreeCadastrTotal;
       property FreeTaxRate:currency read mFreeTaxRate write mFreeTaxRate;
       property FreeTermBegin:TDate read mFreeTermBegin write mFreeTermBegin;
       property FreeTermEnd:TDate read mFreeTermEnd write mFreeTermEnd;
       property FreeTermKoef:currency read mFreeTermKoef write mFreeTermKoef;
       property FreeTotal:currency read mFreeTotal write mFreeTotal;
       property TotalToPay:currency read mTotalToPay write mTotalToPay;
       property Recpay1ToPay:currency read mRecpay1ToPay write mRecpay1ToPay;
       property Recpay1Payed:currency read mRecpay1Payed write mRecpay1Payed;
       property Recpay3ToPay:currency read mRecpay3ToPay write mRecpay3ToPay;
       property Recpay3Payed:currency read mRecpay3Payed write mRecpay3Payed;
       property Recpay5ToPay:currency read mRecpay5ToPay write mRecpay5ToPay;
       property Recpay5Payed:currency read mRecpay5Payed write mRecpay5Payed;
       property Recpay8ToPay:currency read mRecpay8ToPay write mRecpay8ToPay;
       property Recpay8Payed:currency read mRecpay8Payed write mRecpay8Payed;
       property Recpay9ToPay:currency read mRecpay9ToPay write mRecpay9ToPay;
       property Recpay9Payed:currency read mRecpay9Payed write mRecpay9Payed;

       property AllFields:TNameValueList read mAllFields;

       procedure UpdatePaymentTerms(decl:TDeclaration);

       function DumpToText:string;
     end;


     TInnerObjectList=class
     private
      mList:TObjList;
      function GetCount: integer;
      function GetObject(Index: integer): TInnerLandTaxObject;
     protected
     public
      constructor Create;
      destructor Destroy;override;
      property Count:integer read GetCount;
      property Objects[Index:integer]:TInnerLandTaxObject read GetObject;
      procedure AddObject(obj:TInnerLandTaxObject);
      procedure SortByDeptNumberID;
     end;



     TImns=class
     private
      mID:int64;
      mCode:string;
      mName:string;
      mObjects:TInnerObjectList;
     protected
     public
      constructor Create;
      destructor Destroy;override;
      property ID:Int64 read mID write mID;
      property Code:string read mCode write mCode;
      property Name:string read mName write mName;

      procedure AddObject(obj:TInnerLandTaxObject);
      procedure SortObjects;
      function DumpToText:string;
      property Objects:TInnerObjectList read mObjects;
     end;


     TImnsList=class
     private
      mList:TObjList;
      function GetCount: integer;
      function GetImns(Index: integer): TImns;
     protected
     public
      constructor Create;
      destructor Destroy;override;
      property Count:integer read GetCount;
      property Items[Index:integer]:TImns read GetImns;
      function FindOrCreateImns(id:Int64):TImns;
      procedure SortByCode;
     end;

     TDeclaration=class
     private
      mNalogImns:TImnsList;
      mLeaseImns:TImnsList;

      //реквизиты декларации, имнс, плательщика
      mImnsCode:string;
      mImnsName:string;
      mYear:integer;
      mUNP:string;

      mPayerName:string;
      mAddress:string;
      mPerson:string;


      mUsedMonthsCount:integer;

      mUsedMonths:array[1..12]of boolean;
      mUsedMonthIndexes:TIntList;
      procedure SetUsedMonth(month:integer);
      procedure UpdateMonthFieldsByList(l:TImnsList);


      procedure AppendField(objNode:IXmlElement;const fldDesc:TFieldLinkDesc;Fields:TNameValueList);

      procedure AppendTotal1(root:IXmlElement);
      procedure AppendPart1(root:IXmlElement);
      procedure AppendFieldsPart2(root:IXmlElement);
      procedure AppendTotal2(root:IXmlElement);
      procedure AppendPart2(root:IXmlElement);

      procedure AppendSpravka(root:IXmlElement);
      procedure AppendSvedenia1(root:IXmlElement);
      procedure AppendSvedenia2(root:IXmlElement);
      procedure AppendSvedenia3(root:IXmlElement);
      procedure AppendSvedenia4(root:IXmlElement);


     protected

     public
      constructor Create;
      destructor Destroy;override;

      procedure AddObject(obj:TInnerLandTaxObject);

      procedure UpdateMonthFields; 
      procedure Sort;
      function DumpToText:string;
      procedure SaveToFile(const filename:string);
      procedure CreateFile2012(const filename:string);
      procedure CreateFile2013(const filename:string);

      property ImnsCode:string read mImnsCode write mImnsCode;
      property ImnsName:string read mImnsName write mImnsName;
      property Year:integer read mYear write mYear;
      property UNP:string read mUNP write mUNP;
      property Person:String read mPerson write mPerson;
     end;


implementation

uses SysUtils, Base_ExceptionU, CnsUtils, axconstu, Variants, Classes, DMU,
     Usability_ProgressInterfaceU, ConvUtils;




{ TImnsList }

constructor TImnsList.Create;
begin
 mList:=TObjList.Create;
end;

destructor TImnsList.Destroy;
begin
 FreeAndNil(mList);
 inherited;
end;

//TListSortCompare
function FindImnsID(p1,p2:pointer):integer;
var d1:TImns;
    d2:int64;
begin
 d1:=p1;
 d2:=int64(p2^);
 if d1.ID<d2 then Result:=-1 else
 if d1.ID>d2 then Result:=1 else
  Result:=0;
end;

function TImnsList.FindOrCreateImns(id: Int64): TImns;
var idx:integer;
begin
 if mList.FindProc(@id,idx,FindImnsID) then begin
  Result:=Items[idx];
 end else begin
  Result:=TImns.Create;
  Result.ID:=id;
  mList.Insert(idx,Result);
 end;
end;

function TImnsList.GetCount: integer;
begin
 Result:=mList.Count;
end;

function TImnsList.GetImns(Index: integer): TImns;
begin
 if (Index<0)or(Index>=mList.Count) then
  raise Exception.CreateFmt(sIndexError,['TImnsList.GetImns',Index,mList.Count]);
 Result:=mList[Index] as TImns;
end;


//TListSortCompare
function CompareCodes(p1,p2:pointer):integer;
var d1:TImns;
    d2:TImns;
begin
 d1:=p1;
 d2:=p2;
 if d1.Code<d2.Code then Result:=-1 else
 if d1.Code>d2.Code then Result:=1 else
  Result:=0;
end;


procedure TImnsList.SortByCode;
begin
 mList.Sort(CompareCodes);
end;

{ TDeclaration }

constructor TDeclaration.Create;
begin
 mNalogImns:=TImnsList.Create;
 mLeaseImns:=TImnsList.Create;
 mUsedMonthIndexes:=TIntList.Create;
 mUsedMonths[2]:=True;
 mUsedMonths[5]:=True;
 mUsedMonths[8]:=True;
 mUsedMonths[11]:=True;
 mUsedMonthIndexes.AddInt(2);
 mUsedMonthIndexes.AddInt(5);
 mUsedMonthIndexes.AddInt(8);
 mUsedMonthIndexes.AddInt(11);
end;

destructor TDeclaration.Destroy;
begin
 FreeAndNil(mUsedMonthIndexes);
 FreeAndNil(mLeaseImns);
 FreeAndNil(mNalogImns);
 inherited;
end;


procedure TDeclaration.AddObject(obj: TInnerLandTaxObject);
var l:TImnsList;
    imns:TImns;
begin
 l:=nil;
 case obj.Kind of
   0:l:=mNalogImns;//налог
   1:l:=mLeaseImns;//аренда
 else
  MainDM.AddToDBLog(['TDeclaration.AddObject: invalid kind',IntToStr(obj.Kind),IntToStr(obj.mID),obj.mDesc,obj.mNumber],LVL_WARNING);
 end;

 imns:=l.FindOrCreateImns(obj.Imns);
 imns.Name:=obj.ImnsName;
 imns.Code:=obj.MtrfScode;
 imns.AddObject(obj);
end;

procedure TDeclaration.SetUsedMonth(month:integer);
var i:integer;
begin
 if (month<1)or(month>12) then begin
  raise Exception.CreateFmt('%s: invalid month %d',['TDeclaration.SetUsedMonth',month]);
 end;

 //month count
 if(not mUsedMonths[month]) then begin
  if not mUsedMonthIndexes.FindInt(month,i) then begin
   mUsedMonthIndexes.InsertInt(i,month);
  end;
 end; 

 mUsedMonths[month]:=True;
end;

{function TDeclaration.GetUsedMonthHeader(i:integer):string;
begin
 if (i<0)or(i>=mUsedMonthIndexes.Count)
 then Result:=''
 else begin
  Result:=FormatDateTimeXml(EncodeDate(mYear,mUsedMonthIndexes[i],22));
 end;
end;}

procedure TDeclaration.UpdateMonthFields;
begin
 UpdateMonthFieldsByList(mNalogImns);
 UpdateMonthFieldsByList(mLeaseImns);
end;

procedure TDeclaration.UpdateMonthFieldsByList(l:TImnsList);
var i,j,um:integer;
    ltobj:TInnerLandTaxObject;
    imns:TImns;
begin
 for i:=0 to l.Count-1 do begin
  imns:=l.Items[i];
  for j:=0 to imns.Objects.Count-1 do begin
   ltobj:=imns.Objects.Objects[j];
   for um:=0 to mUsedMonthIndexes.Count-1 do begin
    ltobj.AllFields.AddValue('MONTH_PAYED_'+IntToStr(um),CurrToStr(ltobj.mMonthTotals[mUsedMonthIndexes[i]]));
   end;
   for um:=mUsedMonthIndexes.Count to 11 do begin
    ltobj.AllFields.AddValue('MONTH_PAYED_'+IntToStr(um),'0');
   end;
  end;
 end;
end;

procedure TDeclaration.Sort;
var i:integer;
begin
 mNalogImns.SortByCode;
 for i:=0 to mNalogImns.Count-1 do begin
  mNalogImns.Items[i].SortObjects;
 end;
 mLeaseImns.SortByCode;
 for i:=0 to mLeaseImns.Count-1 do begin
  mLeaseImns.Items[i].SortObjects;
 end;
end;

function TDeclaration.DumpToText: string;
var i:integer;
    imns:TImns;
begin
 Result:='Налог'+crlf;
 for i:=0 to mNalogImns.Count-1 do begin
  imns:=mNalogImns.Items[i];
  Result:=Result+imns.DumpToText;
 end;
 Result:=Result+'Аренда'+crlf;
 for i:=0 to mLeaseImns.Count-1 do begin
  imns:=mLeaseImns.Items[i];
  Result:=Result+imns.DumpToText;
 end;
end;



// EXPORT SAVE TO FILE
// EXPORT SAVE TO FILE

//сохранить декларацию в xml файл

procedure TDeclaration.SaveToFile(const filename: string);
var year:integer;

begin 
    year:=mYear;
   if year<=2012 
   then CreateFile2012(filename)
   else CreateFile2013(filename); 

end;

const cRoot_2012           = 'ZemlyaUrLiz';
      cImnsName_2012       = 'ZemlyaUrLiz_v4_f001';
      cPayerName_2012      = 'ZemlyaUrLiz_v4_f002';
      cPayerName_s1_2012   = cPayerName_2012+'_s1';
      cPayerName_s2_2012   = cPayerName_2012+'_s2';
      cPayerName_s3_2012   = cPayerName_2012+'_s3';

      cPart1Total_2012     = 'ZemlyaUrLiz_v4_t003';
      cPart1ImnsTable_2012      = 'ZemlyaUrLiz_v4_l4i';
      cPart1ImnsName_2012       = 'ZemlyaUrLiz_v4_l4i_f001';
      cPart1ImnsCode_2012       = 'ZemlyaUrLiz_v4_l4i_f002';
      cPart1ObjectsTable_2012   = 'ZemlyaUrLiz_v4_l4i_t003';
      cPart1Object_2012         = 'ZemlyaUrLiz_v4_l4i_t003_ri';
      cPart1ObjectsItog_2012    = 'ZemlyaUrLiz_v4_l4i_t003_r';

      cPart2Total_2012          = 'ZemlyaUrLiz_v4_t005';
      cPart2ImnsTable_2012      = 'ZemlyaUrLiz_v4_l6i';
      cPart2ObjectsItog_2012    = 'ZemlyaUrLiz_v4_l6i_t003_r';
      cPart2ImnsName_2012       = 'ZemlyaUrLiz_v4_l6i_f001';
      cPart2ImnsCode_2012       = 'ZemlyaUrLiz_v4_l6i_f002';
      cPart2ObjectsTable_2012   = 'ZemlyaUrLiz_v4_l6i_t003';
      cPart2Object_2012         = 'ZemlyaUrLiz_v4_l6i_t003_ri';

      cPersonName_2012     = 'ZemlyaUrLiz_v4_f007';

type TImnsItogs=array[0..9] of currency;  //TODO больше итогов красивых и разных  тдельный класс для налоги и аренды

procedure TDeclaration.CreateFile2012(const filename: string);
var xml:IXmlDocument;
    payerName:IXmlElement;
    personName:IXmlElement;

    i:integer;
begin
 xml:=CreateXmlDocument(cRoot_2012,'1.0','utf-8');
 xml.DocumentElement.SetAttr('version','4');
 xml.DocumentElement.SetAttr('type','ZEMLYAURLIZ');
 xml.DocumentElement.SetAttr('kodIMNS',mImnsCode);
 xml.DocumentElement.SetAttr('UNP',mUNP);
 xml.DocumentElement.SetIntAttr('year',mYear);
 xml.DocumentElement.SetAttr('term_type','6');
 xml.DocumentElement.SetAttr('utochRaschet','true');
 xml.DocumentElement.SetAttr('xmlns','http://mns/edeclaration/xml/zemlyaurliz/ver4');

 xml.DocumentElement.AppendElement(cImnsName_2012).Text:=AnsiToUtf8(mImnsName);

 payerName:=xml.DocumentElement.AppendElement(cPayerName_2012);
 payerName.AppendElement(cPayerName_s1_2012).Text:=AnsiToUtf8(mPayerName);
 payerName.AppendElement(cPayerName_s2_2012).Text:=AnsiToUtf8(mAddress);
 payerName.AppendElement(cPayerName_s3_2012).Text:=AnsiToUtf8(mPerson);

 //часть 1 - налог
 AppendTotal1(xml.DocumentElement);
 AppendPart1(xml.DocumentElement);

 //часть 2 - аренда
 AppendTotal2(xml.DocumentElement);
 AppendPart2(xml.DocumentElement);

 //ответственное лицо
 personName:=xml.DocumentElement.AppendElement(cPersonName_2012);
 //personName.SetAttr('xmlns','');
 personName.Text:=AnsiToUtf8(mPerson);


 AppendSpravka(xml.DocumentElement);
 AppendSvedenia1(xml.DocumentElement);
 AppendSvedenia2(xml.DocumentElement);
 AppendSvedenia3(xml.DocumentElement);
 AppendSvedenia4(xml.DocumentElement);

 for i:=0 to xml.DocumentElement.ChildNodes.Count-1 do begin
  xml.DocumentElement.ChildNodes[i].SetAttr('xmlns','');
 end;

 xml.Save(filename);
end;

const cRoot_2013           = 'ZemlyaUrLiz';
      cImnsName_2013       = 'ZemlyaUrLiz_v5_f001';
      cPayerName_2013      = 'ZemlyaUrLiz_v5_f002';
      cPayerName_s1_2013   = cPayerName_2013+'_s1';
      cPayerName_s2_2013   = cPayerName_2013+'_s2';
      cPayerName_s3_2013   = cPayerName_2013+'_s3';

      cPart1ImnsTable_2013      = 'ZemlyaUrLiz_v5_l4i';
      cPart1ImnsName_2013       = 'ZemlyaUrLiz_v5_l4i_f001';
      cPart1ImnsCode_2013       = 'ZemlyaUrLiz_v5_l4i_f002';
      cPart1ObjectsTable_2013   = 'ZemlyaUrLiz_v5_l4i_t003';
      cPart1Object_2013         = 'ZemlyaUrLiz_v5_l4i_t003_ri';
      cPart1ObjectsItog_2013    = 'ZemlyaUrLiz_v5_l4i_t003_r';

      cPart2ImnsTable_2013      = 'ZemlyaUrLiz_v5_l5i_l014i';
      cPart2ObjectsItog_2013    = 'ZemlyaUrLiz_v5_l5i_l014i_t003_r';
      cPart2ImnsName_2013       = 'ZemlyaUrLiz_v5_l5i_l014i_f001';
      cPart2ImnsCode_2013       = 'ZemlyaUrLiz_v5_l5i_l014i_f002';
      cPart2ObjectsTable_2013   = 'ZemlyaUrLiz_v5_l5i_l014i_t003';
      cPart2Object_2013         = 'ZemlyaUrLiz_v5_l5i_l014i_t003_ri';

      cPersonName_2013     = 'ZemlyaUrLiz_v5_f006';

      cPart1Total_2013     = 'ZemlyaUrLiz_v5_t003';
      cPart2               = 'ZemlyaUrLiz_v5_l5i';
      cPart2Field          = 'ZemlyaUrLiz_v5_l5i_f';
      cPart2Total_2013     = 'ZemlyaUrLiz_v5_l5i_t013'; 

procedure TDeclaration.CreateFile2013(const filename: string);
var xml:IXmlDocument;
    payerName:IXmlElement;
    personName:IXmlElement;
    part2:IXmlElement;

    i:integer;
begin
 xml:=CreateXmlDocument(cRoot_2013,'1.0','utf-8');
 xml.DocumentElement.SetAttr('version','5');
 xml.DocumentElement.SetAttr('type','ZEMLYAURLIZ');
 xml.DocumentElement.SetAttr('kodIMNS',mImnsCode);
 xml.DocumentElement.SetAttr('UNP',mUNP);
 xml.DocumentElement.SetIntAttr('year',mYear);
 xml.DocumentElement.SetAttr('term_type','6');
 xml.DocumentElement.SetAttr('utochRaschet','true');
 xml.DocumentElement.SetAttr('xmlns','http://mns/edeclaration/xml/zemlyaurliz/ver5');
 xml.DocumentElement.SetAttr('xmlns:xsi','http://www.w3.org/2001/XMLSchema-instance');

 xml.DocumentElement.AppendElement(cImnsName_2013).Text:=AnsiToUtf8(mImnsName);

 payerName:=xml.DocumentElement.AppendElement(cPayerName_2013);
 payerName.AppendElement(cPayerName_s1_2013).Text:=AnsiToUtf8(mPayerName);
 payerName.AppendElement(cPayerName_s2_2013).Text:=AnsiToUtf8(mAddress);
 payerName.AppendElement(cPayerName_s3_2013).Text:=AnsiToUtf8(mPerson);

 //часть 1 - налог
 AppendTotal1(xml.DocumentElement);
 AppendPart1(xml.DocumentElement);

 //часть 2 - аренда
 part2:=xml.DocumentElement.AppendElement(cPart2);
 AppendFieldsPart2(part2);
 AppendTotal2(part2);
 AppendPart2(part2);

 //ответственное лицо
 personName:=xml.DocumentElement.AppendElement(cPersonName_2013);
 //personName.SetAttr('xmlns','');
 personName.Text:=AnsiToUtf8(mPerson);


 AppendSpravka(xml.DocumentElement);
 AppendSvedenia1(xml.DocumentElement);
 AppendSvedenia2(xml.DocumentElement);
 AppendSvedenia3(xml.DocumentElement);
 AppendSvedenia4(xml.DocumentElement);

 for i:=0 to xml.DocumentElement.ChildNodes.Count-1 do begin
  xml.DocumentElement.ChildNodes[i].SetAttr('xmlns','');
 end;

 xml.Save(filename);
end;



const cTotal1Rows=4;
      cTotal1ColumnsMax=11;

      cTotal1_Col_Total = 1; //общий итог к уплате
      cTotal1_Col_Payed1 = 2;//кв 1, 22 февраля
      cTotal1_Col_Payed3 = 4;//кв 2, 22 мая
      cTotal1_Col_Payed5 = 6;//кв 3, 22 августа
      cTotal1_Col_Payed8 = 9;//кв 4, 22 ноября
      cTotal1_Col_Payed9 = 10;//иной срок       TODO внести сроков сколько требуется

      cTotal1_Row_Total1 = 1;
      cTotal1_Row_Total3 = 3;


//добавить общий итог по части 1 - налог
procedure TDeclaration.AppendTotal1(root: IXmlElement);
var total1:IXmlElement;
    totals:array[1..cTotal1Rows,1..cTotal1ColumnsMax] of currency;
    r,c:integer;
    imnsIdx,objIdx:integer;
    imns:TImns;
    ltObj:TInnerLandTaxObject;
    Part1Total:string;
    pTotal1Columns:integer;
begin

//определение года и указание константы.

 if  year<=2012 then begin
   Part1Total:=cPart1Total_2012;
   pTotal1Columns:=10
 end else begin
   Part1Total:=cPart1Total_2013;
   pTotal1Columns:=11;
 end;

 total1:=root.AppendElement(Part1Total);
 FillChar(totals,SizeOf(totals),0);


 for imnsIdx:=0 to mNalogImns.Count-1 do begin
  imns:=mNalogImns.Items[imnsIdx];
  for objIdx:=0 to imns.Objects.Count-1 do begin
   ltObj:=imns.Objects.Objects[objIdx];
   totals[cTotal1_Row_Total1,cTotal1_Col_Total]:=totals[cTotal1_Row_Total1,cTotal1_Col_Total]+ltObj.mTotalToPay;
   totals[cTotal1_Row_Total1,cTotal1_Col_Payed1]:=totals[cTotal1_Row_Total1,cTotal1_Col_Payed1]+ltObj.mRecpay1Payed;
   totals[cTotal1_Row_Total1,cTotal1_Col_Payed3]:=totals[cTotal1_Row_Total1,cTotal1_Col_Payed3]+ltObj.mRecpay3Payed;
   totals[cTotal1_Row_Total1,cTotal1_Col_Payed5]:=totals[cTotal1_Row_Total1,cTotal1_Col_Payed5]+ltObj.mRecpay5Payed;
   totals[cTotal1_Row_Total1,cTotal1_Col_Payed8]:=totals[cTotal1_Row_Total1,cTotal1_Col_Payed8]+ltObj.mRecpay8Payed;
   totals[cTotal1_Row_Total1,cTotal1_Col_Payed9]:=totals[cTotal1_Row_Total1,cTotal1_Col_Payed9]+ltObj.mRecpay9Payed;
  end;
 end;

 for c:=1 to pTotal1Columns do begin
  totals[cTotal1_Row_Total3,c]:=totals[cTotal1_Row_Total1,c];
 end;


 //TODO: посчитать итоги

 for r:=1 to cTotal1Rows do begin
  for c:=1 to pTotal1Columns do begin
   if (r<>1) or (c<>11) then begin
   total1.AppendElement(Part1Total+'_r'+IntToStr(r)+'c'+IntToStr(c)).Text:=CurrToStr(totals[r,c]);
   end;
  end;
 end;

end;

//описание связей полей для части 1 - основной таблицы
const cPart1FieldLinkCount_2012=28;

      part1FieldsLink_2012:array[0..cPart1FieldLinkCount_2012-1] of TFieldLinkDesc=(
       (BalansField:'LNDTX2_ACTS';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric2a'),
       (BalansField:'LNDTX2_ACTDATE';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric2b'), // добавить поле в балансе "дата акта"
       (BalansField:'LTFK_NAME';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric3'),
       (BalansField:'xml_FUNCKIND';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric3a'),
       (BalansField:'xml_CATEG';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric4'),
       (BalansField:'xml_LNDTX2_AREA';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric5'), //гектары
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric6';Kind:1),             //добавить поле в балансе  "Кадастровая оценка участка баллов"
       (BalansField:'LTOBJREC_CADASTRRATE';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric7'),
       //TODO: вычислить эти 4 поля
       (BalansField:'xml_TAXBASE';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric8a'),        //налоговая база    - вычислимый
       (BalansField:'xml_TAXBASEKIND';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric8b'),        //тип налоговой базы
       (BalansField:'xml_TAXRATE';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric9'),         //ставка земельного налога  - вычислимый
       (BalansField:'xml_RATEKIND';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric9a'),        // тип ставки земельного налога
       (BalansField:'LTOBJREC_TERMKOEF';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric10'),
       (BalansField:'xml_LNDTX2_TERMBEGIN';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric10a'),
       (BalansField:'xml_LNDTX2_TERMEND';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric10b'),
       (BalansField:'в месяцах';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric10c';Kind:1),
       (BalansField:'LTOBJREC_KOEFLOCAL';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric11'),         // увеличение уменьшение ставки (доли единицы)
       (BalansField:'LTOBJREC_TOTALTOPAY';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric12';EmptyAsZero:true),
       (BalansField:'RECPAY_1_PAYED';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric13';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric14';Kind:1),
       (BalansField:'RECPAY_3_PAYED';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric15';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric16';Kind:1),
       (BalansField:'RECPAY_5_PAYED';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric17';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric18';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric19';Kind:1),
       (BalansField:'RECPAY_8_PAYED';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric20';EmptyAsZero:true),
       //(BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric21';Kind:1), ///обратить внимание: иной строк в 21, а не в 23 как написано в доке
       (BalansField:'RECPAY_9_PAYED';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric21';EmptyAsZero:true),
       (BalansField:'xml_OTHER_TERM';EDeclField:'ZemlyaUrLiz_v4_l4i_t003_ric22';SkipEmptyElement:true)

      );

const cPart1FieldLinkCount_2013=29;

      part1FieldsLink_2013:array[0..cPart1FieldLinkCount_2013-1] of TFieldLinkDesc=(
       (BalansField:'LNDTX2_ACTS';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric2a'),
       (BalansField:'LNDTX2_ACTDATE';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric2b'), // добавить поле в балансе "дата акта"
       (BalansField:'LTFK_NAME';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric3'),
       (BalansField:'xml_FUNCKIND';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric3a'),
       (BalansField:'xml_CATEG';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric4'),
       (BalansField:'xml_LNDTX2_AREA';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric5'), //гектары
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric6';Kind:1),             //добавить поле в балансе  "Кадастровая оценка участка баллов"
       (BalansField:'LTOBJREC_CADASTRRATE';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric7'),
       //TODO: вычислить эти 4 поля
       (BalansField:'xml_TAXBASE';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric8a'),        //налоговая база    - вычислимый
       (BalansField:'xml_TAXBASEKIND';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric8b'),        //тип налоговой базы
       (BalansField:'xml_TAXRATE';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric9'),         //ставка земельного налога  - вычислимый
       (BalansField:'xml_RATEKIND';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric9a'),        // тип ставки земельного налога
       (BalansField:'LTOBJREC_TERMKOEF';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric10'),
       (BalansField:'xml_LNDTX2_TERMBEGIN';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric10a'),
       (BalansField:'xml_LNDTX2_TERMEND';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric10b'),
       (BalansField:'в месяцах';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric10c';Kind:1),
       (BalansField:'LTOBJREC_KOEFLOCAL';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric11'),         // увеличение уменьшение ставки (доли единицы)
       (BalansField:'LTOBJREC_TOTALTOPAY';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric12';EmptyAsZero:true),
       (BalansField:'RECPAY_1_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric13';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric14';Kind:1),
       (BalansField:'RECPAY_3_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric15';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric16';Kind:1),
       (BalansField:'RECPAY_5_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric17';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric18';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric19';Kind:1),
       (BalansField:'RECPAY_8_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric20';EmptyAsZero:true),
       //(BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric21';Kind:1), ///обратить внимание: иной строк в 21, а не в 23 как написано в доке
       (BalansField:'RECPAY_9_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric21';EmptyAsZero:true),
       (BalansField:'xml_OTHER_TERM';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric22';SkipEmptyElement:true),
       (BalansField:'RECPAY_9_PAYED';EDeclField:'ZemlyaUrLiz_v5_l4i_t003_ric23';EmptyAsZero:true)

      );



procedure AppendNalogImnsItogs(table:IXmlElement;const itogs:TImnsItogs;year:integer);
var Part1ObjectsItog:string;

begin

 if year<=2012 then begin
   Part1ObjectsItog:=cPart1ObjectsItog_2012
 end else begin
   Part1ObjectsItog:=cPart1ObjectsItog_2013;
 end;

 table.AppendElement(Part1ObjectsItog+'n-3c12').Text:=CurrToStr(itogs[0]);
 table.AppendElement(Part1ObjectsItog+'n-3c13').Text:=CurrToStr(itogs[1]);
 table.AppendElement(Part1ObjectsItog+'n-3c14').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-3c15').Text:=CurrToStr(itogs[3]);
 table.AppendElement(Part1ObjectsItog+'n-3c16').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-3c17').Text:=CurrToStr(itogs[5]);
 table.AppendElement(Part1ObjectsItog+'n-3c18').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-3c19').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-3c20').Text:=CurrToStr(itogs[8]);
 table.AppendElement(Part1ObjectsItog+'n-3c21').Text:=CurrToStr(itogs[9]);
 if year<=2012 then begin
  table.AppendElement(Part1ObjectsItog+'n-3c22').Text:='0'
 end else begin
  table.AppendElement(Part1ObjectsItog+'n-3c23').Text:='0';
 end;

 table.AppendElement(Part1ObjectsItog+'n-2c12').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c13').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c14').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c15').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c16').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c17').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c18').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c19').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c20').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-2c21').Text:='0';
 if year<=2012 then begin
  table.AppendElement(Part1ObjectsItog+'n-2c22').Text:='0'
 end else begin
  table.AppendElement(Part1ObjectsItog+'n-2c23').Text:='0';
 end;

 table.AppendElement(Part1ObjectsItog+'n-1c12').Text:=CurrToStr(itogs[0]);
 table.AppendElement(Part1ObjectsItog+'n-1c13').Text:=CurrToStr(itogs[1]);
 table.AppendElement(Part1ObjectsItog+'n-1c14').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-1c15').Text:=CurrToStr(itogs[3]);
 table.AppendElement(Part1ObjectsItog+'n-1c16').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-1c17').Text:=CurrToStr(itogs[5]);
 table.AppendElement(Part1ObjectsItog+'n-1c18').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-1c19').Text:='0';
 table.AppendElement(Part1ObjectsItog+'n-1c20').Text:=CurrToStr(itogs[8]);
 table.AppendElement(Part1ObjectsItog+'n-1c21').Text:=CurrToStr(itogs[9]);
 if year<=2012 then begin
  table.AppendElement(Part1ObjectsItog+'n-1c22').Text:='0'
 end else begin
  table.AppendElement(Part1ObjectsItog+'n-1c23').Text:='0';
 end;

 table.AppendElement(Part1ObjectsItog+'nc12').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc13').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc14').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc15').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc16').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc17').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc18').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc19').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc20').Text:='0';
 table.AppendElement(Part1ObjectsItog+'nc21').Text:='0';
 if year<=2012 then begin
  table.AppendElement(Part1ObjectsItog+'nc22').Text:='0'
 end else begin
  table.AppendElement(Part1ObjectsItog+'nc23').Text:='0';
 end;
end;

//добавить часть 1 - налог
procedure TDeclaration.AppendPart1(root: IXmlElement);
var total1:IXmlElement;
    part1ImnsTable:IXmlElement;
    part1ObjectsTable:IXmlElement;
    part1Object:IXmlElement;

    itogs:TImnsItogs;

    imnsIdx,objectIdx,fieldIdx:integer;

    value:string;

    Part1FieldLinkCount:integer;
    part1FieldsLink:PFieldLinkDescArray;
    pPart1ImnsTable:string;
    pPart1ImnsName:string;
    pPart1ImnsCode:string;
    pPart1ObjectsTable:string;
    pPart1Object:string;

    fldDesc:TFieldLinkDesc;

    imns:TImns;
    ltObj:TInnerLandTaxObject;

begin

//определение года и указание константы.
 if year<=2012 then begin
   Part1FieldLinkCount:=cPart1FieldLinkCount_2012;
   part1FieldsLink:=@part1FieldsLink_2012;
   pPart1ImnsTable:=cPart1ImnsTable_2012;
   pPart1ImnsName:=cPart1ImnsName_2012;
   pPart1ImnsCode:=cPart1ImnsCode_2012;
   pPart1ObjectsTable:=cPart1ObjectsTable_2012;
   pPart1Object:=cPart1Object_2012;
 end else begin
   Part1FieldLinkCount:=cPart1FieldLinkCount_2013;
   part1FieldsLink:=@part1FieldsLink_2013;
   pPart1ImnsTable:=cPart1ImnsTable_2013;
   pPart1ImnsName:=cPart1ImnsName_2013;
   pPart1ImnsCode:=cPart1ImnsCode_2013;
   pPart1ObjectsTable:=cPart1ObjectsTable_2013;
   pPart1Object:=cPart1Object_2013;
 end;

 for imnsIdx:=0 to mNalogImns.Count-1 do begin
  imns:=mNalogImns.Items[imnsIdx];
  part1ImnsTable:=root.AppendElement(pPart1ImnsTable);
  part1ImnsTable.AppendElement(pPart1ImnsName).Text:=AnsiToUtf8(imns.mName);
  part1ImnsTable.AppendElement(pPart1ImnsCode).Text:=imns.mCode;

  part1ObjectsTable:=part1ImnsTable.AppendElement(pPart1ObjectsTable);

  FillChar(itogs,SizeOf(itogs),0);
  for objectIdx:=0 to imns.Objects.Count-1 do begin
   ltObj:=imns.Objects.Objects[objectIdx];
   part1Object:=part1ObjectsTable.AppendElement(pPart1Object);

   for fieldIdx:=0 to Part1FieldLinkCount-1 do begin
    AppendField(part1Object,part1FieldsLink[fieldIdx],ltObj.AllFields);
   end;

   itogs[0]:=itogs[0]+ltObj.TotalToPay;
   itogs[1]:=itogs[1]+ltObj.Recpay1Payed;
   itogs[3]:=itogs[3]+ltObj.Recpay3Payed;
   itogs[5]:=itogs[5]+ltObj.Recpay5Payed;
   itogs[8]:=itogs[8]+ltObj.Recpay8Payed;
   itogs[9]:=itogs[9]+ltObj.Recpay9Payed;
  end;

  AppendNalogImnsItogs(part1ObjectsTable,itogs, Year);

 end;
end;


//====================================================================================
//====================================================================================
//часть 2 - аренда

const cTotal2Rows=4;
      cTotal2ColumnsMax=13;

   //   cTotal2_Col_Total = 1; //общий итог к уплате
    //  cTotal2_Col_Payed1 = 2;//кв 1, 22 февраля
   //   cTotal2_Col_Payed3 = 3;//кв 2, 22 мая
   //   cTotal2_Col_Payed5 = 4;//кв 3, 22 августа
   //   cTotal2_Col_Payed8 = 6;//кв 4, 22 ноября
   //   cTotal2_Col_Payed9 = 7;//иной срок

      cTotal2_Row_Total1 = 1;
      cTotal2_Row_Total3 = 3;

procedure TDeclaration.AppendFieldsPart2(root: IXmlElement);
var i:integer;
begin
 for i:=0 to mUsedMonthIndexes.Count-1 do begin
  root.AppendElement(cPart2Field+FormatFloat('000',i+1)).Text:=
   FormatDateTimeXml(EncodeDate(mYear,mUsedMonthIndexes[i],22));
 end;

 for i:=mUsedMonthIndexes.Count to 11 do begin
  root.AppendElement(cPart2Field+FormatFloat('000',i+1)).SetAttr('xsi:nil','true');
 end;

(*  root.AppendElement(cPart2Field+'001').Text:=FormatDateTimeXml(EncodeDate(mYear,2,22));
  root.AppendElement(cPart2Field+'002').Text:=FormatDateTimeXml(EncodeDate(mYear,5,22));
  root.AppendElement(cPart2Field+'003').Text:=FormatDateTimeXml(EncodeDate(mYear,8,22));
  root.AppendElement(cPart2Field+'004').Text:=FormatDateTimeXml(EncodeDate(mYear,11,22));
//TODO здесь можн сделать условие либо статически  забить все сроки уплаты, я бы забила все
  root.AppendElement(cPart2Field+'005').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'006').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'007').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'008').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'009').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'010').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'011').SetAttr('xsi:nil','true');
  root.AppendElement(cPart2Field+'012').SetAttr('xsi:nil','true');*)
end;

//добавить общий итог по части 2 - аренда
procedure TDeclaration.AppendTotal2(root: IXmlElement);
var total2:IXmlElement;
   // totals:array[1..cTotal2Rows,1..cTotal2ColumnsMax] of currency;
    r,c,i,m,n:integer;
    imnsIdx,objIdx:integer;
    imns:TImns;
    ltObj:TInnerLandTaxObject;
    pPart2Total:string;
    pTotal2Columns:integer;
    pTotal2_Col_Payed8:integer;
    MonthTotals:TMonthTotals;
    MonthTotalsAll:currency;
    total:currency;
begin

 if year<=2012 then begin
   pPart2Total:=cPart2Total_2012;
   pTotal2Columns:=7;
   pTotal2_Col_Payed8:=6
  end else begin
   pPart2Total:=cPart2Total_2013;
   pTotal2Columns:=13;
  // pTotal2_Col_Payed8:=5
  end;

// TODO как то определить иной срок в этой части и разложить по срокам

 total2:=root.AppendElement(pPart2Total);
// FillChar(totals,SizeOf(totals),0);

 FillChar(MonthTotals,SizeOf(MonthTotals),0);
 MonthTotalsAll:=0;

 for imnsIdx:=0 to mLeaseImns.Count-1 do begin
  imns:=mLeaseImns.Items[imnsIdx];
  for objIdx:=0 to imns.Objects.Count-1 do begin
   ltObj:=imns.Objects.Objects[objIdx];
 {  totals[cTotal2_Row_Total1,cTotal2_Col_Total]:=totals[cTotal2_Row_Total1,cTotal2_Col_Total]+ltObj.mTotalToPay;  //итог по всем
   totals[cTotal2_Row_Total1,cTotal2_Col_Payed1]:=totals[cTotal2_Row_Total1,cTotal2_Col_Payed1]+ltObj.mRecpay1Payed;
   totals[cTotal2_Row_Total1,cTotal2_Col_Payed3]:=totals[cTotal2_Row_Total1,cTotal2_Col_Payed3]+ltObj.mRecpay3Payed;
   totals[cTotal2_Row_Total1,cTotal2_Col_Payed5]:=totals[cTotal2_Row_Total1,cTotal2_Col_Payed5]+ltObj.mRecpay5Payed;
   totals[cTotal2_Row_Total1,pTotal2_Col_Payed8]:=totals[cTotal2_Row_Total1,pTotal2_Col_Payed8]+ltObj.mRecpay8Payed;
   totals[cTotal2_Row_Total1,cTotal2_Col_Payed9]:=totals[cTotal2_Row_Total1,cTotal2_Col_Payed9]+ltObj.mRecpay9Payed;}
   MonthTotalsAll:=MonthTotalsAll+ltObj.mTotalToPay;       //итого
   for m:=1 to 12 do begin                                //сгрупировали суммы по срокам
    MonthTotals[m]:=MonthTotals[m]+ltObj.mMonthTotals[m];
   end;
  end;
 end;

 //TODO: use MonthTotals to fill Lease total part


{ for c:=1 to cTotal2ColumnsMax do begin
  totals[cTotal2_Row_Total3,c]:=totals[cTotal2_Row_Total1,c]; //приравнивание данных по строке 1 в строку 3
 end;}

//TODO переделать - создание непосредственно элемента таблицы xml

 for r:=1 to cTotal2Rows do begin
  for n:=0 to pTotal2Columns-1 do begin

   if n<mUsedMonthIndexes.Count
   then total:=MonthTotals[mUsedMonthIndexes[n]]
   else total:=0;

   if (r=1) or (r=3) then begin
    if n=0 then
    total2.AppendElement(pPart2Total+'_r'+IntToStr(r)+'c'+IntToStr(n)).Text:=CurrToStr(MonthTotalsAll)
    else
    total2.AppendElement(pPart2Total+'_r'+IntToStr(r)+'c'+IntToStr(n)).Text:=CurrToStr(total);
   end else
    total2.AppendElement(pPart2Total+'_r'+IntToStr(r)+'c'+IntToStr(n)).Text:='0';
  end;  
 end;

end;

//описание связей полей для части 2
const cPart2FieldLinkCount_2012=19;

      part2FieldsLink_2012:array[0..cPart2FieldLinkCount_2012-1] of TFieldLinkDesc=(
       (BalansField:'LNDTX2_ACTS';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric2a'),
       (BalansField:'LNDTX2_ACTDATE';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric2b'),      //дата выдачи акта
       (BalansField:'LTFK_NAME';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric3'),
       (BalansField:'xml_FUNCKIND';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric3a'),
       (BalansField:'xml_CATEG';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric4'),
       (BalansField:'xml_LNDTX2_AREA';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric5'),
       (BalansField:'LTOBJREC_LEASETOTAL';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric6'),
       (BalansField:'LTOBJREC_TERMKOEF';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric7'),
       (BalansField:'xml_LNDTX2_TERMBEGIN';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric7a'),
       (BalansField:'xml_LNDTX2_TERMEND';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric7b'),
       (BalansField:'в месяцах';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric7c';Kind:1),
       (BalansField:'LTOBJREC_TOTALTOPAY';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric8';EmptyAsZero:true),
       (BalansField:'RECPAY_1_PAYED';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric9';EmptyAsZero:true),
       (BalansField:'RECPAY_3_PAYED';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric10';EmptyAsZero:true),
       (BalansField:'RECPAY_5_PAYED';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric11';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric12';Kind:1),
       (BalansField:'RECPAY_8_PAYED';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric13';EmptyAsZero:true),
       (BalansField:'xml_OTHER_TERM';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric14';SkipEmptyElement:true),     
       (BalansField:'RECPAY_9_PAYED';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric15';EmptyAsZero:true) // не заполнялось, т.к. там null
       //(BalansField:'0';EDeclField:'ZemlyaUrLiz_v4_l6i_t003_ric15';Kind:1)
             );

const cPart2FieldLinkCount_2013=24;

      part2FieldsLink_2013:array[0..cPart2FieldLinkCount_2013-1] of TFieldLinkDesc=(
       (BalansField:'LNDTX2_ACTS';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric2a'),
       (BalansField:'LNDTX2_ACTDATE';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric2b'),      //дата выдачи акта
       (BalansField:'LTFK_NAME';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric3'),
       (BalansField:'xml_FUNCKIND';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric3a'),
       (BalansField:'xml_CATEG';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric4'),
       (BalansField:'xml_LNDTX2_AREA';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric5'),
       (BalansField:'LTOBJREC_LEASETOTAL';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric6'),
       (BalansField:'LTOBJREC_TERMKOEF';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric7'),
       (BalansField:'xml_LNDTX2_TERMBEGIN';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric7a'),
       (BalansField:'xml_LNDTX2_TERMEND';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric7b'),
       (BalansField:'в месяцах';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric7c';Kind:1),
       (BalansField:'LTOBJREC_TOTALTOPAY';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric8';EmptyAsZero:true),
       (BalansField:'RECPAY_1_PAYED';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric9';EmptyAsZero:true),        //TODO Month_payed_1-12
       (BalansField:'RECPAY_3_PAYED';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric10';EmptyAsZero:true),
       (BalansField:'RECPAY_5_PAYED';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric11';EmptyAsZero:true),
       (BalansField:'RECPAY_8_PAYED';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric12';EmptyAsZero:true),
       (BalansField:'RECPAY_9_PAYED';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric13';EmptyAsZero:true),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric14';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric15';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric16';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric17';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric18';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric19';Kind:1),
       (BalansField:'0';EDeclField:'ZemlyaUrLiz_v5_l5i_l014i_t003_ric20';Kind:1)
             );

procedure AppendLeaseImnsItogs(table:IXmlElement;const itogs:TImnsItogs;const monthTotals:TMonthTotals; monthIndexes:TIntList; year:integer);
var Part2ObjectsItog:string;
    i:integer;
    total:currency;
begin

 if year<=2012 then begin
   Part2ObjectsItog:=cPart2ObjectsItog_2012
 end else begin
   Part2ObjectsItog:=cPart2ObjectsItog_2013
 end;

//TODO month totals 1-12 вместо itogs в 2013 году - разделить 2012 и 2013 полностью а не частями

 table.AppendElement(Part2ObjectsItog+'n-3c8').Text:=CurrToStr(itogs[0]);
 table.AppendElement(Part2ObjectsItog+'n-3c9').Text:=CurrToStr(itogs[1]);
 table.AppendElement(Part2ObjectsItog+'n-3c10').Text:=CurrToStr(itogs[3]);
 table.AppendElement(Part2ObjectsItog+'n-3c11').Text:=CurrToStr(itogs[5]);

 if year<=2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-3c12').Text:='0';
 end else begin
  table.AppendElement(Part2ObjectsItog+'n-3c12').Text:=CurrToStr(itogs[8]);
 end;

 if year<=2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-3c13').Text:=CurrToStr(itogs[8]);
 end else begin
  table.AppendElement(Part2ObjectsItog+'n-3c13').Text:='0';
 end;

 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-3c14').Text:='0'
 end;
 table.AppendElement(Part2ObjectsItog+'n-3c15').Text:=CurrToStr(itogs[9]);     //TODO итоги разложить
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-3c16').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-3c17').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-3c18').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-3c19').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-3c20').Text:='0'
 end;


 table.AppendElement(Part2ObjectsItog+'n-2c8').Text:='0';
 table.AppendElement(Part2ObjectsItog+'n-2c9').Text:='0';
 table.AppendElement(Part2ObjectsItog+'n-2c10').Text:='0';
 table.AppendElement(Part2ObjectsItog+'n-2c11').Text:='0';
 table.AppendElement(Part2ObjectsItog+'n-2c12').Text:='0';
 table.AppendElement(Part2ObjectsItog+'n-2c13').Text:='0';
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-2c14').Text:='0'
 end;
 table.AppendElement(Part2ObjectsItog+'n-2c15').Text:='0';
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-2c16').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-2c17').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-2c18').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-2c19').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-2c20').Text:='0'
 end;


 table.AppendElement(Part2ObjectsItog+'n-1c8').Text:=CurrToStr(itogs[0]);
 table.AppendElement(Part2ObjectsItog+'n-1c9').Text:=CurrToStr(itogs[1]);
 table.AppendElement(Part2ObjectsItog+'n-1c10').Text:=CurrToStr(itogs[3]);
 table.AppendElement(Part2ObjectsItog+'n-1c11').Text:=CurrToStr(itogs[5]);
 if year<=2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-1c12').Text:='0';
 end else begin
  table.AppendElement(Part2ObjectsItog+'n-1c12').Text:=CurrToStr(itogs[8]);
 end;
 if year<=2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-1c13').Text:=CurrToStr(itogs[8]);
 end else begin
  table.AppendElement(Part2ObjectsItog+'n-1c13').Text:='0';
 end;
// table.AppendElement(Part2ObjectsItog+'n-1c12').Text:='0';
// table.AppendElement(Part2ObjectsItog+'n-1c13').Text:=CurrToStr(itogs[8]);
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-1c14').Text:='0'
 end;
 table.AppendElement(Part2ObjectsItog+'n-1c15').Text:=CurrToStr(itogs[9]);
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'n-1c16').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-1c17').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-1c18').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-1c19').Text:='0';
  table.AppendElement(Part2ObjectsItog+'n-1c20').Text:='0'
 end;

 //суммы по используемым месяцам
 for i:=0 to 11 do begin
  if i<monthIndexes.Count
    then total:=monthTotals[monthIndexes[i]]
    else total:=0;
  //использовать total для заполнения элементов, номер колонки считать исходя как C+i, где C - номер колонки для первого месяца
 end;

 
 table.AppendElement(Part2ObjectsItog+'nc8').Text:='0';
 table.AppendElement(Part2ObjectsItog+'nc9').Text:='0';
 table.AppendElement(Part2ObjectsItog+'nc10').Text:='0';
 table.AppendElement(Part2ObjectsItog+'nc11').Text:='0';
 table.AppendElement(Part2ObjectsItog+'nc12').Text:='0';
 table.AppendElement(Part2ObjectsItog+'nc13').Text:='0';
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'nc14').Text:='0'
 end;
 table.AppendElement(Part2ObjectsItog+'nc15').Text:='0';
 if year>2012 then begin
  table.AppendElement(Part2ObjectsItog+'nc16').Text:='0';
  table.AppendElement(Part2ObjectsItog+'nc17').Text:='0';
  table.AppendElement(Part2ObjectsItog+'nc18').Text:='0';
  table.AppendElement(Part2ObjectsItog+'nc19').Text:='0';
  table.AppendElement(Part2ObjectsItog+'nc20').Text:='0'
 end;

end;



//добавить часть 2 - аренда
procedure TDeclaration.AppendPart2(root: IXmlElement);
var total2:IXmlElement;
    part2ImnsTable:IXmlElement;
    part2ObjectsTable:IXmlElement;
    part2Object:IXmlElement;
    itogs:TImnsItogs;
    monthTotals:TMonthTotals;
    imnsIdx,objectIdx,fieldIdx:integer;
    value:string;
    imns:TImns;
    ltObj:TInnerLandTaxObject;

    m:integer;

    Part2FieldLinkCount:integer;
    part2FieldsLink:PFieldLinkDescArray;
    pPart2ImnsTable:string;
    pPart2ImnsName:string;
    pPart2ImnsCode:string;
    pPart2ObjectsTable:string;
    pPart2Object:string;

begin

 if year<=2012 then begin
  Part2FieldLinkCount:=cPart2FieldLinkCount_2012;
  part2FieldsLink:=@part2FieldsLink_2012;
  pPart2ImnsTable:=cPart2ImnsTable_2012;
  pPart2ImnsName:=cPart2ImnsName_2012;
  pPart2ImnsCode:=cPart2ImnsCode_2012;
  pPart2ObjectsTable:=cPart2ObjectsTable_2012;
  pPart2Object:=cPart2Object_2012
 end else begin
  Part2FieldLinkCount:=cPart2FieldLinkCount_2013;
  part2FieldsLink:=@part2FieldsLink_2013;
  pPart2ImnsTable:=cPart2ImnsTable_2013;
  pPart2ImnsName:=cPart2ImnsName_2013;
  pPart2ImnsCode:=cPart2ImnsCode_2013;
  pPart2ObjectsTable:=cPart2ObjectsTable_2013;
  pPart2Object:=cPart2Object_2013
 end;

 for imnsIdx:=0 to mLeaseImns.Count-1 do begin
  imns:=mLeaseImns.Items[imnsIdx];
  part2ImnsTable:=root.AppendElement(pPart2ImnsTable);
  part2ImnsTable.AppendElement(pPart2ImnsName).Text:=AnsiToUtf8(imns.mName);
  part2ImnsTable.AppendElement(pPart2ImnsCode).Text:=imns.mCode;

  part2ObjectsTable:=part2ImnsTable.AppendElement(pPart2ObjectsTable);

  FillChar(itogs,SizeOf(itogs),0);
  FillChar(monthTotals,SizeOf(monthTotals),0);
  for objectIdx:=0 to imns.Objects.Count-1 do begin
   ltObj:=imns.Objects.Objects[objectIdx];
   part2Object:=part2ObjectsTable.AppendElement(pPart2Object);


   for fieldIdx:=0 to Part2FieldLinkCount-1 do begin
    AppendField(part2Object,part2FieldsLink[fieldIdx],ltObj.AllFields);
   end;

   itogs[0]:=itogs[0]+ltObj.TotalToPay;
   itogs[1]:=itogs[1]+ltObj.Recpay1Payed;
   itogs[3]:=itogs[3]+ltObj.Recpay3Payed;
   itogs[5]:=itogs[5]+ltObj.Recpay5Payed;
   itogs[8]:=itogs[8]+ltObj.Recpay8Payed;
   itogs[9]:=itogs[9]+ltObj.Recpay9Payed;

   for m:=1 to 12 do begin
    monthTotals[m]:=monthTotals[m]+ltobj.mMonthTotals[m];
   end;
  end;

  AppendLeaseImnsItogs(part2ObjectsTable,itogs,monthTotals,mUsedMonthIndexes,year);

 end;
end;


const cSpravka_2012         =  'ZemlyaUrLiz_v4_spravka';
      cSpravka_Table_2012   =  'ZemlyaUrLiz_v4_spravka_t001';
      cSpravka_Person_2012  =  'ZemlyaUrLiz_v4_spravka_f002';

      cSpravka_2013         =  'ZemlyaUrLiz_v5_spravka';
      cSpravka_Table_2013   =  'ZemlyaUrLiz_v5_spravka_t001';
      cSpravka_Person_2013  =  'ZemlyaUrLiz_v5_spravka_f002';


      cSvedenia1_2012       =  'ZemlyaUrLiz_v4_svedenia1';
      cSvedenia1_Date_2012  =  'ZemlyaUrLiz_v4_svedenia1_f001';
      cSvedenia1_f002_2012  =  'ZemlyaUrLiz_v4_svedenia1_f002';
      cSvedenia1_f003_2012  =  'ZemlyaUrLiz_v4_svedenia1_f003';
      cSvedenia1_f004_2012  =  'ZemlyaUrLiz_v4_svedenia1_f004';
      cSvedenia1_f005_2012  =  'ZemlyaUrLiz_v4_svedenia1_f005';
      cSvedenia1_t006_2012  =  'ZemlyaUrLiz_v4_svedenia1_t006';
      cSvedenia1_Person_2012  = 'ZemlyaUrLiz_v4_svedenia1_f007';

      cSvedenia1_2013       =  'ZemlyaUrLiz_v5_svedenia1';
      cSvedenia1_Date_2013  =  'ZemlyaUrLiz_v5_svedenia1_f001';
      cSvedenia1_f002_2013  =  'ZemlyaUrLiz_v5_svedenia1_f002';
      cSvedenia1_f003_2013  =  'ZemlyaUrLiz_v5_svedenia1_f003';
      cSvedenia1_f004_2013  =  'ZemlyaUrLiz_v5_svedenia1_f004';
      cSvedenia1_f005_2013  =  'ZemlyaUrLiz_v5_svedenia1_f005';
      cSvedenia1_t006_2013  =  'ZemlyaUrLiz_v5_svedenia1_t006';
      cSvedenia1_Person_2013  = 'ZemlyaUrLiz_v5_svedenia1_f007';

      cSvedenia2_2012       =  'ZemlyaUrLiz_v4_svedenia2';
      cSvedenia2_f001_2012  =  'ZemlyaUrLiz_v4_svedenia2_f001';
      cSvedenia2_f002_2012  =  'ZemlyaUrLiz_v4_svedenia2_f002';
      cSvedenia2_f003_2012  =  'ZemlyaUrLiz_v4_svedenia2_f003';
      cSvedenia2_f004_2012  =  'ZemlyaUrLiz_v4_svedenia2_f004';
      cSvedenia2_f005_2012  =  'ZemlyaUrLiz_v4_svedenia2_f005';
      cSvedenia2_t006_2012  =  'ZemlyaUrLiz_v4_svedenia2_t006';
      cSvedenia2_Person_2012  = 'ZemlyaUrLiz_v4_svedenia2_f007';

      cSvedenia2_2013       =  'ZemlyaUrLiz_v5_svedenia2';
      cSvedenia2_f001_2013  =  'ZemlyaUrLiz_v5_svedenia2_f001';
      cSvedenia2_f002_2013  =  'ZemlyaUrLiz_v5_svedenia2_f002';
      cSvedenia2_f003_2013  =  'ZemlyaUrLiz_v5_svedenia2_f003';
      cSvedenia2_f004_2013  =  'ZemlyaUrLiz_v5_svedenia2_f004';
      cSvedenia2_f005_2013  =  'ZemlyaUrLiz_v5_svedenia2_f005';
      cSvedenia2_t006_2013  =  'ZemlyaUrLiz_v5_svedenia2_t006';
      cSvedenia2_Person_2013  = 'ZemlyaUrLiz_v5_svedenia2_f007';

      cSvedenia3_2012       = 'ZemlyaUrLiz_v4_svedenia3';
      cSvedenia3_Table_2012 = 'ZemlyaUrLiz_v4_svedenia3_t001';
      cSvedenia3_Itog1_2012 = 'ZemlyaUrLiz_v4_svedenia3_t001_rnc6';
      cSvedenia3_Itog2_2012 = 'ZemlyaUrLiz_v4_svedenia3_t001_rnc7';
      cSvedenia3_Person_2012  = 'ZemlyaUrLiz_v4_svedenia3_f002';

      cSvedenia3_2013       = 'ZemlyaUrLiz_v5_svedenia3';
      cSvedenia3_Table_2013 = 'ZemlyaUrLiz_v5_svedenia3_t001';
      cSvedenia3_Itog1_2013 = 'ZemlyaUrLiz_v5_svedenia3_t001_rnc6';
      cSvedenia3_Itog2_2013 = 'ZemlyaUrLiz_v5_svedenia3_t001_rnc7';
      cSvedenia3_Person_2013  = 'ZemlyaUrLiz_v5_svedenia3_f002';

      cSvedenia4_2012       = 'ZemlyaUrLiz_v4_svedenia4';
      cSvedenia4_Table1_2012 = 'ZemlyaUrLiz_v4_svedenia4_t001';
      cSvedenia4_1_2_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc2';
      cSvedenia4_1_3_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc3';
      cSvedenia4_1_4_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc4';
      cSvedenia4_1_5_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc5';
      cSvedenia4_1_6_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc6';
      cSvedenia4_1_7_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc7';
      cSvedenia4_1_8_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc8';
      cSvedenia4_1_9_2012    = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc9';
      cSvedenia4_1_10_2012   = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc10';
      cSvedenia4_1_10a_2012  = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc10a';
      cSvedenia4_1_11_2012   = 'ZemlyaUrLiz_v4_svedenia4_t001_rnc11';

      cSvedenia4_2013       = 'ZemlyaUrLiz_v5_svedenia4';
      cSvedenia4_Table1_2013 = 'ZemlyaUrLiz_v5_svedenia4_t001';
      cSvedenia4_1_2_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc2';
      cSvedenia4_1_3_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc3';
      cSvedenia4_1_4_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc4';
      cSvedenia4_1_5_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc5';
      cSvedenia4_1_6_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc6';
      cSvedenia4_1_7_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc7';
      cSvedenia4_1_8_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc8';
      cSvedenia4_1_9_2013    = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc9';
      cSvedenia4_1_10_2013   = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc10';
      cSvedenia4_1_10a_2013  = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc10a';
      cSvedenia4_1_11_2013   = 'ZemlyaUrLiz_v5_svedenia4_t001_rnc11';


      cSvedenia4_Table2_2012 = 'ZemlyaUrLiz_v4_svedenia4_t002';
      cSvedenia4_2_2_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc2';
      cSvedenia4_2_3_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc3';
      cSvedenia4_2_4_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc4';
      cSvedenia4_2_5_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc5';
      cSvedenia4_2_6_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc6';
      cSvedenia4_2_7_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc7';
      cSvedenia4_2_8_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc8';
      cSvedenia4_2_9_2012    = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc9';
      cSvedenia4_2_10_2012   = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc10';
      cSvedenia4_2_11_2012   = 'ZemlyaUrLiz_v4_svedenia4_t002_rnc11';

      cSvedenia4_Table2_2013 = 'ZemlyaUrLiz_v5_svedenia4_t002';
      cSvedenia4_2_2_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc2';
      cSvedenia4_2_3_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc3';
      cSvedenia4_2_4_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc4';
      cSvedenia4_2_5_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc5';
      cSvedenia4_2_6_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc6';
      cSvedenia4_2_7_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc7';
      cSvedenia4_2_8_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc8';
      cSvedenia4_2_9_2013    = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc9';
      cSvedenia4_2_10_2013   = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc10';
      cSvedenia4_2_11_2013   = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc11';
      cSvedenia4_2_12_2013   = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc12';
      cSvedenia4_2_13_2013   = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc13';
      cSvedenia4_2_14_2013   = 'ZemlyaUrLiz_v5_svedenia4_t002_rnc14';


procedure TDeclaration.AppendSpravka(root: IXmlElement);
var spravka:IXmlElement;
    pSpravka:string;
    pSpravka_Table:string;
    pSpravka_Person:string;
begin

 if year<=2012 then begin
  pSpravka:=cSpravka_2012;
  pSpravka_Table:=cSpravka_Table_2012;
  pSpravka_Person:=cSpravka_Person_2012
 end else begin
  pSpravka:=cSpravka_2013;
  pSpravka_Table:=cSpravka_Table_2013;
  pSpravka_Person:=cSpravka_Person_2013
 end;

 spravka:=root.AppendElement(pSpravka);
 spravka.AppendElement(pSpravka_Table);
 spravka.AppendElement(pSpravka_Person).Text:=AnsiToUtf8(Person);
end;


procedure TDeclaration.AppendSvedenia1(root: IXmlElement);
var svedenia1:IXmlElement;
    pSvedenia1:string;
    pSvedenia1_Date:string;
    pSvedenia1_f002:string;
    pSvedenia1_f003:string;
    pSvedenia1_f004:string;
    pSvedenia1_f005:string;
    pSvedenia1_t006:string;
    pSvedenia1_Person:string;
begin

 if year<=2012 then begin
  pSvedenia1:=cSvedenia1_2012;
  pSvedenia1_Date:=cSvedenia1_Date_2012;
  pSvedenia1_f002:=cSvedenia1_f002_2012;
  pSvedenia1_f003:=cSvedenia1_f003_2012;
  pSvedenia1_f004:=cSvedenia1_f004_2012;
  pSvedenia1_f005:=cSvedenia1_f005_2012;
  pSvedenia1_t006:=cSvedenia1_t006_2012;
  pSvedenia1_Person:=cSvedenia1_Person_2012
 end else begin
  pSvedenia1:=cSvedenia1_2013;
  pSvedenia1_Date:=cSvedenia1_Date_2013;
  pSvedenia1_f002:=cSvedenia1_f002_2013;
  pSvedenia1_f003:=cSvedenia1_f003_2013;
  pSvedenia1_f004:=cSvedenia1_f004_2013;
  pSvedenia1_f005:=cSvedenia1_f005_2013;
  pSvedenia1_t006:=cSvedenia1_t006_2013;
  pSvedenia1_Person:=cSvedenia1_Person_2013
 end;
 //FormatDateTimeXml(EncodeDate(mYear,1,1));
 svedenia1:=root.AppendElement(pSvedenia1);
 svedenia1.AppendElement(pSvedenia1_Date).Text:=FormatDateTimeXml(EncodeDate(mYear,1,1));
 svedenia1.AppendElement(pSvedenia1_f002).Text:='0';
 svedenia1.AppendElement(pSvedenia1_f003).Text:='0';
 svedenia1.AppendElement(pSvedenia1_f004).Text:='0';
 svedenia1.AppendElement(pSvedenia1_f005).Text:='0';
 svedenia1.AppendElement(pSvedenia1_t006);
 svedenia1.AppendElement(pSvedenia1_Person).Text:=AnsiToUtf8(Person);

end;

procedure TDeclaration.AppendSvedenia2(root: IXmlElement);
var svedenia2:IXmlElement;
    pSvedenia2:string;
    pSvedenia2_f001:string;
    pSvedenia2_f002:string;
    pSvedenia2_f003:string;
    pSvedenia2_f004:string;
    pSvedenia2_f005:string;
    pSvedenia2_t006:string;
    pSvedenia2_Person:string;

begin

 if year<=2012 then begin
  pSvedenia2:=cSvedenia2_2012;
  pSvedenia2_f001:=cSvedenia2_f001_2012;
  pSvedenia2_f002:=cSvedenia2_f002_2012;
  pSvedenia2_f003:=cSvedenia2_f003_2012;
  pSvedenia2_f004:=cSvedenia2_f004_2012;
  pSvedenia2_f005:=cSvedenia2_f005_2012;
  pSvedenia2_t006:=cSvedenia2_t006_2012;
  pSvedenia2_Person:=cSvedenia2_Person_2012;
 end else begin
  pSvedenia2:=cSvedenia2_2013;
  pSvedenia2_f001:=cSvedenia2_f001_2013;
  pSvedenia2_f002:=cSvedenia2_f002_2013;
  pSvedenia2_f003:=cSvedenia2_f003_2013;
  pSvedenia2_f004:=cSvedenia2_f004_2013;
  pSvedenia2_f005:=cSvedenia2_f005_2013;
  pSvedenia2_t006:=cSvedenia2_t006_2013;
  pSvedenia2_Person:=cSvedenia2_Person_2013;
 end;
  //FormatDateTimeXml(EncodeDate(mYear,1,1));
 svedenia2:=root.AppendElement(pSvedenia2);
 svedenia2.AppendElement(pSvedenia2_f001).Text:='0';
 svedenia2.AppendElement(pSvedenia2_f002).Text:='0';
 svedenia2.AppendElement(pSvedenia2_f003).Text:='0';
 svedenia2.AppendElement(pSvedenia2_f004).Text:='0';
 svedenia2.AppendElement(pSvedenia2_f005).Text:='0';
 svedenia2.AppendElement(pSvedenia2_t006);
 svedenia2.AppendElement(pSvedenia2_Person).Text:=AnsiToUtf8(Person);
end;

procedure TDeclaration.AppendSvedenia3(root: IXmlElement);
var  svedenia3:IXmlElement;
     svedenia3table:IXmlElement;
     pSvedenia3:string;
     pSvedenia3_Table:string;
     pSvedenia3_Itog1:string;
     pSvedenia3_Itog2:string;
     pSvedenia3_Person:string;
begin

 if year<=2012 then begin
  pSvedenia3:=cSvedenia3_2012;
  pSvedenia3_Table:=cSvedenia3_Table_2012;
  pSvedenia3_Itog1:=cSvedenia3_Itog1_2012;
  pSvedenia3_Itog2:=cSvedenia3_Itog2_2012;
  pSvedenia3_Person:=cSvedenia3_Person_2012
 end else begin
  pSvedenia3:=cSvedenia3_2013;
  pSvedenia3_Table:=cSvedenia3_Table_2013;
  pSvedenia3_Itog1:=cSvedenia3_Itog1_2013;
  pSvedenia3_Itog2:=cSvedenia3_Itog2_2013;
  pSvedenia3_Person:=cSvedenia3_Person_2013
 end;

  svedenia3:=root.AppendElement(pSvedenia3);
  svedenia3table:=svedenia3.AppendElement(pSvedenia3_Table);
  svedenia3table.AppendElement(pSvedenia3_Itog1).Text:='0';
  svedenia3table.AppendElement(pSvedenia3_Itog2).Text:='0';
  svedenia3.AppendElement(pSvedenia3_Person).Text:=AnsiToUtf8(Person);
end;


procedure TDeclaration.AppendSvedenia4(root: IXmlElement);
var svedenia4:IXmlElement;
    svedenia4table1:IXmlElement;
    svedenia4table2:IXmlElement;

    pSvedenia4:string;
    pSvedenia4_Table1:string;
    pSvedenia4_1_2:string;
    pSvedenia4_1_3:string;
    pSvedenia4_1_4:string;
    pSvedenia4_1_5:string;
    pSvedenia4_1_6:string;
    pSvedenia4_1_7:string;
    pSvedenia4_1_8:string;
    pSvedenia4_1_9:string;
    pSvedenia4_1_10:string;
    pSvedenia4_1_10a:string;
    pSvedenia4_1_11:string;
    pSvedenia4_Table2:string;
    pSvedenia4_2_2:string;
    pSvedenia4_2_3:string;
    pSvedenia4_2_4:string;
    pSvedenia4_2_5:string;
    pSvedenia4_2_6:string;
    pSvedenia4_2_7:string;
    pSvedenia4_2_8:string;
    pSvedenia4_2_9:string;
    pSvedenia4_2_10:string;
    pSvedenia4_2_11:string;
    pSvedenia4_2_12:string;
    pSvedenia4_2_13:string;
    pSvedenia4_2_14:string;

begin

 if year<=2012 then begin
  pSvedenia4:=cSvedenia4_2012;       
  pSvedenia4_Table1:=cSvedenia4_Table1_2012;
  pSvedenia4_1_2:=cSvedenia4_1_2_2012;   
  pSvedenia4_1_3:=cSvedenia4_1_3_2012;   
  pSvedenia4_1_4:=cSvedenia4_1_4_2012;   
  pSvedenia4_1_5:=cSvedenia4_1_5_2012;   
  pSvedenia4_1_6:=cSvedenia4_1_6_2012;   
  pSvedenia4_1_7:=cSvedenia4_1_7_2012;   
  pSvedenia4_1_8:=cSvedenia4_1_8_2012;   
  pSvedenia4_1_9:=cSvedenia4_1_9_2012;   
  pSvedenia4_1_10:=cSvedenia4_1_10_2012;
  pSvedenia4_1_10a:=cSvedenia4_1_10a_2012; 
  pSvedenia4_1_11:=cSvedenia4_1_11_2012;  
  pSvedenia4_Table2:=cSvedenia4_Table2_2012;
  pSvedenia4_2_2:=cSvedenia4_2_2_2012;   
  pSvedenia4_2_3:=cSvedenia4_2_3_2012;   
  pSvedenia4_2_4:=cSvedenia4_2_4_2012;   
  pSvedenia4_2_5:=cSvedenia4_2_5_2012;   
  pSvedenia4_2_6:=cSvedenia4_2_6_2012;   
  pSvedenia4_2_7:=cSvedenia4_2_7_2012;   
  pSvedenia4_2_8:=cSvedenia4_2_8_2012;   
  pSvedenia4_2_9:=cSvedenia4_2_9_2012;   
  pSvedenia4_2_10:=cSvedenia4_2_10_2012;  
  pSvedenia4_2_11:=cSvedenia4_2_11_2012
 end else begin
  pSvedenia4:=cSvedenia4_2013;       
  pSvedenia4_Table1:=cSvedenia4_Table1_2013;
  pSvedenia4_1_2:=cSvedenia4_1_2_2013;   
  pSvedenia4_1_3:=cSvedenia4_1_3_2013;   
  pSvedenia4_1_4:=cSvedenia4_1_4_2013;   
  pSvedenia4_1_5:=cSvedenia4_1_5_2013;   
  pSvedenia4_1_6:=cSvedenia4_1_6_2013;   
  pSvedenia4_1_7:=cSvedenia4_1_7_2013;   
  pSvedenia4_1_8:=cSvedenia4_1_8_2013;   
  pSvedenia4_1_9:=cSvedenia4_1_9_2013;   
  pSvedenia4_1_10:=cSvedenia4_1_10_2013;
  pSvedenia4_1_10a:=cSvedenia4_1_10a_2013; 
  pSvedenia4_1_11:=cSvedenia4_1_11_2013;  
  pSvedenia4_Table2:=cSvedenia4_Table2_2013;
  pSvedenia4_2_2:=cSvedenia4_2_2_2013;   
  pSvedenia4_2_3:=cSvedenia4_2_3_2013;   
  pSvedenia4_2_4:=cSvedenia4_2_4_2013;
  pSvedenia4_2_5:=cSvedenia4_2_5_2013;   
  pSvedenia4_2_6:=cSvedenia4_2_6_2013;   
  pSvedenia4_2_7:=cSvedenia4_2_7_2013;   
  pSvedenia4_2_8:=cSvedenia4_2_8_2013;   
  pSvedenia4_2_9:=cSvedenia4_2_9_2013;   
  pSvedenia4_2_10:=cSvedenia4_2_10_2013;  
  pSvedenia4_2_11:=cSvedenia4_2_11_2013;
  pSvedenia4_2_12:=cSvedenia4_2_12_2013;
  pSvedenia4_2_13:=cSvedenia4_2_13_2013;
  pSvedenia4_2_14:=cSvedenia4_2_14_2013
 end;

 svedenia4:=root.AppendElement(pSvedenia4);
 svedenia4table1:=svedenia4.AppendElement(pSvedenia4_Table1);
 svedenia4table1.AppendElement(pSvedenia4_1_2).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_3).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_4).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_5).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_6).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_7).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_8).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_9).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_10).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_10a).Text:='0';
 svedenia4table1.AppendElement(pSvedenia4_1_11).Text:='0';
 svedenia4table2:=svedenia4.AppendElement(pSvedenia4_Table2);
 svedenia4table2.AppendElement(pSvedenia4_2_2).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_3).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_4).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_5).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_6).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_7).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_8).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_9).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_10).Text:='0';
 svedenia4table2.AppendElement(pSvedenia4_2_11).Text:='0';
 if year>2012 then begin
   svedenia4table2.AppendElement(pSvedenia4_2_12).Text:='0';
   svedenia4table2.AppendElement(pSvedenia4_2_13).Text:='0';
   svedenia4table2.AppendElement(pSvedenia4_2_14).Text:='0';
 end;
end;

procedure TDeclaration.AppendField(objNode: IXmlElement; const fldDesc: TFieldLinkDesc; Fields: TNameValueList);
var value:string;
begin
 try
  if fldDesc.Kind=0 then begin
   value:=Fields.ValueByName(fldDesc.BalansField);
   if fldDesc.SkipEmptyElement and (value='') then Exit;
   if fldDesc.EmptyAsZero and (value='') then
    value:='0';
   objNode.AppendElement(fldDesc.EDeclField).Text:=AnsiToUtf8(value);
  end else begin
   objNode.AppendElement(fldDesc.EDeclField).Text:=AnsiToUtf8(fldDesc.BalansField);
  end;
 except
  on E:Exception do begin
   raise Exception.CreateFmt('AppendField: error %s in %s (%s %s)',[e.Message,objNode.AsElement.NodeName,fldDesc.BalansField,fldDesc.EDeclField]); 
  end;
 end;
end;


//--------------------------------------------


{ TInnerLandTaxObject }

constructor TInnerLandTaxObject.Create;
begin
 mAllFields:=TNameValueList.Create;
end;

destructor TInnerLandTaxObject.Destroy;
begin
 FreeAndNil(mAllFields);
 inherited;
end;

function TInnerLandTaxObject.DumpToText: string;
begin
 Result:='    '+IntToStr(id)+' '+Number+' '+Acts+'  '+Address+'   '+CurrToStr(TaxTotal);
end;

function TInnerLandTaxObject.GetIntNumber: integer;
begin
 Result:=StrToIntDef(mNumber,0);
end;


procedure TInnerLandTaxObject.UpdatePaymentTerms(decl:TDeclaration);
var y,w,d:word;
begin
 mMonthTotals[2]:=mRecpay1Payed;
 mMonthTotals[5]:=mRecpay3Payed;
 mMonthTotals[8]:=mRecpay5Payed;
 mMonthTotals[11]:=mRecpay8Payed;

 //non-zero other term
 if mRecpay9Payed<>0 then begin
   case Kind of
    0:begin
     mMonthTotals[12]:=mRecpay9Payed;//tax
     decl.SetUsedMonth(12);
    end;
    1:begin//lease

     DecodeDate(mTermBegin,y,w,d);
     if(mMonthTotals[w]<>0) then begin
      MainDM.AddToDBLog(['TDeclaration.UpdatePaymentTerms: Object',IntToStr(mID),mDesc,mNumber,'has non-zero total in other term',DateToStr(mTermBegin)],LVL_WARNING);
     end;
     decl.SetUsedMonth(w);
     mMonthTotals[w]:=mMonthTotals[w]+mRecpay9Payed;
    end;
   else
    mMonthTotals[12]:=mRecpay9Payed;//default
    MainDM.AddToDBLog(['TDeclaration.UpdatePaymentTerms: invalid kind',IntToStr(Kind),IntToStr(mID),mDesc,mNumber],LVL_WARNING);
   end;
 end;
end;



{ TImns }

procedure TImns.AddObject(obj: TInnerLandTaxObject);
begin
 mObjects.AddObject(obj);
end;

constructor TImns.Create;
begin
 mObjects:=TInnerObjectList.Create;
end;

destructor TImns.Destroy;
begin
 FreeAndNil(mObjects);
 inherited;
end;

function TImns.DumpToText: string;
var i:integer;
begin
 Result:='  Имнс:'+Code+' '+Name+crlf;
 for i:=0 to mObjects.Count-1 do begin
  Result:=Result+mObjects.Objects[i].DumpToText+crlf;
 end;
end;

procedure TImns.SortObjects;
begin
 mObjects.SortByDeptNumberID;
end;

{ TInnerObjectList }

procedure TInnerObjectList.AddObject(obj: TInnerLandTaxObject);
begin
  mList.Add(obj);
end;

constructor TInnerObjectList.Create;
begin
  mList:=TObjList.Create;
end;

destructor TInnerObjectList.Destroy;
begin
  FreeAndNil(mList);
 inherited;
end;

function TInnerObjectList.GetCount: integer;
begin
  Result:=mList.Count;
end;

function TInnerObjectList.GetObject(Index: integer): TInnerLandTaxObject;
begin
  if (Index<0)or(Index>=mList.Count) then
  raise Exception.CreateFmt(sIndexError,['TImnsObjectList.GetObject',Index,mList.Count]);
 Result:=mList[Index] as TInnerLandTaxObject;
end;

function CompareDeptNumberID(p1,p2:pointer):integer;
var d1:TInnerLandTaxObject;
    d2:TInnerLandTaxObject;
begin
 d1:=p1;
 d2:=p2;
 if d1.Dept<d2.Dept then Result:=-1 else
 if d1.Dept>d2.Dept then Result:=1 else

 if d1.IntNumber<d2.IntNumber then Result:=-1 else
 if d1.IntNumber>d2.IntNumber then Result:=1 else

 if d1.ID<d2.ID then Result:=-1 else
 if d1.ID>d2.ID then Result:=1 else
  Result:=0;
end;

procedure TInnerObjectList.SortByDeptNumberID;
begin
 mList.Sort(CompareDeptNumberID);
end;

end.
