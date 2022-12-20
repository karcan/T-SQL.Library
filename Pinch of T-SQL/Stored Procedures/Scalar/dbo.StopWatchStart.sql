-- =============================================
-- Author:				<Ozbal, Karcan>
-- Create date:			<2022-12-20 yyyyMMdd>
-- Description:			<Stop Watch Start>
-- Execution script:	EXEC StopWatchStop @pStopWatch = @vStopWatch, @pElapsedMS = @vElapsedMS OUTPUT, @pElapsedTime = @vElapsedTime OUTPUT
-- =============================================
CREATE PROCEDURE [dbo].[StopWatchStart]
AS
BEGIN
	DECLARE @vStart		DATETIME2(7)	= SYSUTCDATETIME(),
			@vResult	INT				= DATEDIFF(SECOND, {d '1970-01-01'}, GETDATE());

	DECLARE @vKey		NVARCHAR(13)	= CONCAT(N'SW:', @vResult)

	EXEC sp_set_session_context @vKey, @vStart

	RETURN @vResult
END