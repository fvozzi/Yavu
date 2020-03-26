YavuEnvironment systemClass: (YavuSystem enabledSubsystemsClasses: 
				(Array with: YavuTransientSubsystem with: YavuSecuritySubsystem )).
WAAdmin register: TBSYavuLogin asApplicationAt: 'yavu'.
ZnZincServerAdaptor startOn: 8080
