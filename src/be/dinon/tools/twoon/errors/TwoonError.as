package be.dinon.tools.twoon.errors
{
	public class TwoonError extends Error
	{
		public function TwoonError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}