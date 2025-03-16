RegisterCommand('propfix', function()
    local ped = PlayerPedId()
    local object = GetGamePool('CObject')
    local objectSize = #object
    for i = 1, objectSize do
        if DoesEntityExist(object[i]) then
            local attachedPed = GetEntityAttachedTo(object[i])
            if ped == attachedPed then
                local attachedProp = object[i]
                SetEntityAsMissionEntity(attachedProp, false, true)
                DetachEntity(attachedProp, false, false)
                DeleteObject(attachedProp)
                break
            end
        end
    end
end, false)

TriggerEvent('chat:addSuggestion', '/propfix', 'It allows you to detach an object from your character!', {})