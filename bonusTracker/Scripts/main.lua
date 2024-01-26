RegisterHook("/Game/Pal/Blueprint/UI/NPCHPGauge/WBP_PalNPCHPGauge.WBP_PalNPCHPGauge_C:BindFromHandle", function(self, handler)
    local para = handler:get():TryGetIndividualParameter().SaveParameter
    local kind = para.CharacterID:ToString()
    print(string.format("[WidgetMod] New Bind for Kind=%s, Talent = %d\n", kind, para.Talent_HP))

    records = FindAllOf("BP_PalPlayerRecordData_C")
    if records then 
        for Index,record in pairs(records) do
            print(string.format("[WidgetMod] Get BP_PalPlayerRecordData_C @ %d\n", record:GetAddress()))
            local items = record.PalCaptureCount.Items
            items:ForEach(function(index, elem_wrapper)
                local palrec = elem_wrapper:get()
                if palrec.Key:ToString() == kind then
                    local capture = palrec.Value
                    print(string.format("[WidgetMod] Get BP_PalPlayerRecordData_C:Capture[%s] = %d/10; Widget = %d\n", kind, capture, self:get():GetAddress()))
              
                end
            end)
        end
    end
end)
