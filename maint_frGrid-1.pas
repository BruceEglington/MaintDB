���� JFIF  ` `  �� C 		



	�� C��  0 0" ��              	�� 0      !1	"AQ#2a
Bq����              �� ,         !1AQa�"q���R�����   ? �8�1�{m5ZTjcj�1��ذ\m@� }�#�<}|��؃Lt@�;�����?'µ��qw�q�c'��b��V�JĲ�ۆFU
�K)$8b��Khx
ꗜ,GH�4���G"����k��'�L��?�B�V��+��=��S�kĨQ�}�Ƒ�����O�1߶��ܯ��M8�T�$d]���[z���&:������2�r�Oƃ9U�UEZ��� oo��� '��?曏�Խ����C��6Cs���_�V��TWF+�m~ʐ&�_y%7�':�N�֬��C�ǚӲ�,G�>4~s[SESj����ZzT���z&��*�������W��e_�.5�\�y�D��,O܀J��I�z{�������[�.�?O3Gٱ�h���׶���o� L�K��G�-�\�5��Ue�~Ǐ�'a*4������ X�=� �|P>s֎��_�e�X�15�I-�"F�j��G��#Y�����t������R׊��]7#h-2*\t7�oX����.�tS�b+G��_9���rID�Xc/;�v���#1�w�w� ���c��X���3�=<�Lz���Ȱ���a�ư�f)v5'�$lv��c_��U��r+�??@fn��s8�#"�h�VY+<Id,`����m���|u1X��/%�.��x��]�^ܳ���0D��D+Ӏo� ����A)q�.�piO_���$��F�놥J�l2�������P��|��V����\�c�[�%^���DPLZ�@E���;O2�d)���ت�T$�Ĉ��?-� -�������N�t���Q�^V�ص��;�r6��;!�E�"b}2΋���
	(FK�6R�z�z��O��IZK��F��ʗ�W:�l���׈��2�w���l֠9�Zޞ�>�2��EZ��A�ܝ>!��yu�>ax�NqX�p��<���m[�a�ֿh�e��X(�&P;��}�?=C�|[�t��of8��t���"5^z� ^3%��}��HE?t��a�)Cᓥ_��u�_�K�n��}+�	���ܧݤ��~��_=�>�9N#�p7���P椩*�z�8�	����t���ݲ��4��L��̚� T~'�rz�k���qM�c�}�~��s~�rnq���3�{��x�UOַ��#ǯP�BI �����?�
\|xnK���^_��5�_�H�9e��C2",�4���m��؃�q���'���bX+D �w����쑯o���}���0�Vl\��i�rՔ���N�`N���w�������+[$��_RF�N��8^o,���V�7=�rn�c#�B�^��dP�S�aT�t�،t�v~G�Ϩ] �}W�ȹ5��o��֍J�eu�,�]�1B��E=ͭ�q�����nb�,dM�ĺR8���~��^�O�}�|��x�Q��i~��:f���U����@�o��<m�(d���f�T*�z{��oM2T�+[�2��Z9ew���w�Ub@RW�}���ˌy���i:6�1�xѮAԍ����?�N�s����λ��Oyx�d���Y�;�m�0�gH��������o�a�eo����4�w�4�Kv��.�� ���� ��LL%T#H������                                                                                                   begin
    dmR.Query1.Close;
    dmR.cdsQuery1.Close;
    dmR.cdsQuery1.Open;
    iwlPrevPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
  end;
end;

procedure TISFGrid.iwDBgResultsColumns1Click(ASender: TObject;
  const AValue: String);
begin
  UserSession.ParameterChosen := AValue;
  UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
  TIWAppForm(WebApplication.ActiveForm).Hide;
  TISFIssueEdit.Create(WebApplication).Show
end;

procedure TISFGrid.iwbNewIssueClick(Sender: TObject);
var
  MaximumIssue : integer;
begin
  dmR.cdsMaxIssue.Close;
  dmR.cdsMaxIssue.Open;
  MaximumIssue := dmR.cdsMaxIssueMAX.AsInteger;
  dmR.cdsMaxIssue.Close;
  UserSession.ParameterChosen := IntToStr(MaximumIssue + 1);
  dmR.qIssueDetails.Close;
  dmR.qIssueDetails.ParamByName('ISSUEID').AsString := UserSession.ParameterChosen;
  dmR.cdsIssueDetails.Close;
  dmR.cdsIssueDetails.Open;
  try
    dmR.cdsIssueDetails.Append;
    dmR.cdsIssueDetailsISSUEID.AsInteger := MaximumIssue + 1;
    dmR.cdsIssueDetailsPROBLEMSHORT.AsString := '';
    dmR.cdsIssueDetailsPROBLEM.AsString := '';
    dmR.cdsIssueDetailsEQUIPMENTID.AsString := '0';
    dmR.cdsIssueDetailsTECHNICIANID.AsString := '0';
    dmR.cdsIssueDetailsSOLUTION.AsString := '';
    dmR.cdsIssueDetailsDATEENTERED.AsDateTime := Date;
    dmR.cdsIssueDetailsDATEREPAIRED.AsDateTime := Date;
    dmR.cdsIssueDetailsCATEGORYID.AsString := '0';
    dmR.cdsIssueDetailsCOMPLETE.AsString := 'N';
    dmR.cdsIssueDetails.Post;
    dmR.cdsIssueDetails.ApplyUpdates(0);
    UserSession.LastVisitedForm := TIWAppFormClass(WebApplication.ActiveForm.ClassType);
    TIWAppForm(WebApplication.ActiveForm).Hide;
    TISFIssueEdit.Create(WebApplication).Show
  except
    WebApplication.ShowMessage('Unable to append new record');
  end;
end;

end.
